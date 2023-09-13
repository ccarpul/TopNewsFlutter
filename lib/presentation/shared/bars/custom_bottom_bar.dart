

import 'package:flutter/material.dart';
import 'package:top_news_flutter/utils/string_extensions.dart';

enum TabItem { home, saved }

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.onTap, required this.currentIndex});

  final ValueChanged<int> onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          activeIcon: const Icon(Icons.home_filled),
          label: TabItem.home.name.capitalize()
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.bookmark_outline),
          activeIcon: const Icon(Icons.bookmark),
          label: TabItem.saved.name.capitalize()
        ),
      ]
      );
  }
}