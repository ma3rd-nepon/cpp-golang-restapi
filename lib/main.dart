import 'package:flutter/material.dart';
import 'package:go_dart_e2e/widgets/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 123',
      theme: ThemeData(
        colorScheme: ColorScheme.dark()
      ),
      home: const MainAppManager(),
    );
  }
}
