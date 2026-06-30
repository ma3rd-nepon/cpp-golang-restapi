import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


// ==============================================
// ============ ЭМИР ГДЕ БАЗА ДАННЫХ ============
// ==============================================
class DatabaseService {
  Database? _db;

  final _messageController = StreamController<List<Map<String, dynamic>>>.broadcast();
  Stream<List<Map<String, dynamic>>> get messageStream => _messageController.stream;

  Future<void> init() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'db_service.db');

    if (!await File(path).exists()) {
      // Копируем из assets
      final data = await rootBundle.load('assets/messenger.db');
      final bytes = data.buffer.asUint8List();
      await File(path).writeAsBytes(bytes);
    }

    // Открываем
    _db = await openDatabase(path);
  }

  Future<void> addMessage(String text, String sender) async {
    await _db?.insert('messages', {
      'text': text,
      'sender': sender,
      'time': DateTime.now().toIso8601String(),
    });
    _notifyListeners();
  }

  Future<List<Map<String, dynamic>>> getMessages() async {
    return await _db?.query('messages', orderBy: 'time DESC') ?? [];
  }

  void _notifyListeners() async {
    final messages = await getMessages();
    _messageController.add(messages);
  }

  void dispose() {
    _messageController.close();
    _db?.close();
  }
}