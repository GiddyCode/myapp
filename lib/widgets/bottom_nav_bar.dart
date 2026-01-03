import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
      selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
      unselectedItemColor: theme.bottomNavigationBarTheme.unselectedItemColor,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(icon: Icon(LucideIcons.house), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.layoutGrid),
          label: 'Hub',
        ),
        BottomNavigationBarItem(icon: Icon(LucideIcons.star), label: 'Ratings'),
        BottomNavigationBarItem(icon: Icon(LucideIcons.user), label: 'Profile'),
      ],
    );
  }
}
