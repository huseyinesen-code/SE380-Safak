import 'package:flutter/material.dart';

import '../features/home/home_screen.dart';
import '../features/lists/lists_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/search/search_screen.dart';

// The main layout: the current tab's screen plus the bottom navigation bar.
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  // Which tab is active (0 = Home).
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack keeps every screen alive, so a tab remembers its
      // scroll position when you switch away and come back.
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          SearchScreen(),
          ListsScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // setState rebuilds this widget with the newly selected tab.
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Lists'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
