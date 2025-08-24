import 'package:flutter/material.dart';
import 'package:som_devprofile/src/custom/header_logo.dart';

import '../../tabs/scroll_controller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  // Listen to list positions to update selection while user scrolls
  @override
  void initState() {
    super.initState();
    itemPositionsListener.itemPositions.addListener(_onPositionsChanged);
  }

  @override
  void dispose() {
    itemPositionsListener.itemPositions.removeListener(_onPositionsChanged);
    super.dispose();
  }

  void _onPositionsChanged() {
    // Determine the first fully or mostly visible item and update index
    final positions = itemPositionsListener.itemPositions.value;
    if (positions.isEmpty) return;

    // Get the item with the smallest index that is visible, preferring the one most on-screen
    final visible = positions.toList()
      ..sort((a, b) {
        // Sort by index, then by how close its leading edge is to 0.0
        final primary = a.index.compareTo(b.index);
        if (primary != 0) return primary;
        return a.itemLeadingEdge.abs().compareTo(b.itemLeadingEdge.abs());
      });

    final candidate = visible.first;

    // Optional: ensure it's at least partially visible (leading < 0.6)
    final int newIndex = candidate.index;

    if (newIndex != _currentIndex && mounted) {
      setState(() => _currentIndex = newIndex);
    }
  }

  // Define nav items once so we can render either a standard BottomNavigationBar
  // or a horizontally scrollable custom bar for larger lists.
  static const List<_NavItem> _items = [
    _NavItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Home',
      tooltip: 'Home',
    ),
    _NavItem(
      icon: Icons.lightbulb_outline,
      activeIcon: Icons.lightbulb,
      label: 'What I Do',
      tooltip: 'What I Do',
    ),
    _NavItem(
      icon: Icons.school_outlined,
      activeIcon: Icons.school,
      label: 'Education',
      tooltip: 'Education',
    ),
    _NavItem(
      icon: Icons.work_outline,
      activeIcon: Icons.work,
      label: 'Experience',
      tooltip: 'Experience',
    ),
    _NavItem(
      icon: Icons.widgets_outlined,
      activeIcon: Icons.widgets,
      label: 'Projects',
      tooltip: 'Projects',
    ),
    _NavItem(
      icon: Icons.verified_outlined,
      activeIcon: Icons.verified,
      label: 'Certs',
      tooltip: 'Certifications',
    ),
    _NavItem(
      icon: Icons.mail_outline,
      activeIcon: Icons.mail,
      label: 'Contact',
      tooltip: 'Contact',
    ),
  ];

  void _onTap(int index) {
    setState(() => _currentIndex = index);
    if (scroll.isAttached) {
      scroll.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // If we ever have many items, switch to a horizontally scrollable bottom bar.
    final bool useScrollable = _items.length > 5;

    if (!useScrollable) {
      // Standard BottomNavigationBar with proper icon sizes and colors
      return SafeArea(
        top: false,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          selectedIconTheme: IconThemeData(
            size: 24,
            color: theme.colorScheme.primary,
          ),
          unselectedIconTheme: IconThemeData(
            size: 22,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
          selectedItemColor: theme.colorScheme.primary,
          unselectedItemColor:
              theme.colorScheme.onSurface.withValues(alpha: 0.7),
          backgroundColor: theme.colorScheme.surface,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: _onTap,
          items: _items
              .map(
                (i) => BottomNavigationBarItem(
                  icon: Icon(i.icon),
                  activeIcon: Icon(i.activeIcon),
                  label: i.label,
                  tooltip: i.tooltip,
                ),
              )
              .toList(),
        ),
      );
    }

    // Scrollable custom bottom bar for larger item counts
    return SafeArea(
      top: false,
      child: Material(
        color: theme.colorScheme.surface,
        elevation: 8,
        child: SizedBox(
          height: 64,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                const SizedBox(width: 8),
                const HeaderLogo(),
                const SizedBox(width: 5),
                Row(
                  children: List.generate(_items.length, (index) {
                    final item = _items[index];
                    final bool selected = index == _currentIndex;
                    final Color iconColor = selected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface.withValues(alpha: 0.7);
                    final TextStyle labelStyle = TextStyle(
                      fontSize: 12,
                      fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                      color: iconColor,
                    );

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => _onTap(index),
                        child: Tooltip(
                          message: item.tooltip,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: selected
                                  ? theme.colorScheme.primary
                                      .withValues(alpha: 0.08)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(selected ? item.activeIcon : item.icon,
                                    size: 24, color: iconColor),
                                const SizedBox(height: 4),
                                Text(item.label, style: labelStyle),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String tooltip;
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.tooltip,
  });
}
