import 'package:flutter/material.dart';
import 'package:go_dart_e2e/services/page_manager.dart';
import 'package:go_dart_e2e/services/pages.dart';
import 'package:go_dart_e2e/widgets/app_bottom_bar.dart';

class MainAppManager extends StatefulWidget {
  const MainAppManager({super.key});

  @override
  State<MainAppManager> createState() => _MainAppState();
}

class _MainAppState extends State<MainAppManager> {
  final _pageManager = PageManager();
  bool _loggedIn = false;

  @override
  void initState() {
    super.initState();
    _initPages();
    _pageManager.addListener(() => setState(() {}));
  }

  void _initPages() {
    List<PageEntry> DEFAULT_PAGES = [
      const PageEntry(id: PageId.chat, page: ChatsPage(), canBeClosed: false, isInBar: true),
      const PageEntry(id: PageId.calls, page: CallsPage(), canBeClosed: false, isInBar: true),
      const PageEntry(id: PageId.settings, page: SettingsPage(), canBeClosed: false, isInBar: true),
      const PageEntry(id: PageId.profile, page: ProfilePage(), canBeClosed: false, isInBar: true),
    ];

    for (final page in DEFAULT_PAGES) {
      _pageManager.openPage(page);
    }
  }

  void onLoginSuccess() {
    _pageManager.removePageForever(PageId.login);
    setState(() => _loggedIn = true);
    _pageManager.openPreviousPage(); // казню если увижу в релизе
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_pageManager.pages.isEmpty) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (!_loggedIn) {
      _pageManager.openPage(
        PageEntry(
          id: PageId.login,
          page: LoginPage(loginSuccess: onLoginSuccess),
        ),
      );
    }

    return Scaffold(
      body: IndexedStack(
        index: _pageManager.currentIndex,
        children: _pageManager.pages.map((e) => e.page).toList(),
      ),
      bottomNavigationBar: _loggedIn
          ? AppBottomBar(pageManager: _pageManager)
          : null,
    );
  }
}
