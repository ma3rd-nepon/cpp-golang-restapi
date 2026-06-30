import 'package:flutter/material.dart';
import 'package:go_dart_e2e/services/page_manager.dart';

class AppBottomBar extends StatelessWidget {
  final PageManager pageManager;

  const AppBottomBar({super.key, required this.pageManager});

  @override
  Widget build(BuildContext context) {
    final tabs = pageManager.tabs;

    if (tabs.isEmpty) return const SizedBox.shrink();

    return BottomNavigationBar(
      currentIndex: _currentTabIndex(tabs),
      onTap: (index) => pageManager.switchTab(index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      items: tabs.map(_buildItem).toList(),
    );
  }

  int _currentTabIndex(List<PageEntry> tabs) {
    final currentId = pageManager.currentPage.id;
    final index = tabs.indexWhere((t) => t.id == currentId);
    return index != -1 ? index : 0;
  }

  BottomNavigationBarItem _buildItem(PageEntry entry) {
    return BottomNavigationBarItem(
      icon: Icon(entry.id.icon),
      label: entry.id.label,
    );
  }
}