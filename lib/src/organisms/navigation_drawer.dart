import 'package:flutter/material.dart';
import '../molecules/molecules.dart';

/// Organismo de cajón de navegación (drawer)
class Pragma4NavigationDrawer extends StatelessWidget {
  const Pragma4NavigationDrawer({
    super.key,
    required this.items,
    this.header,
    this.footer,
    this.selectedIndex = 0,
    this.onItemSelected,
  });

  final List<Pragma4NavigationDrawerItem> items;
  final Widget? header;
  final Widget? footer;
  final int selectedIndex;
  final ValueChanged<int>? onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          if (header != null) header!,
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0), // sm
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Pragma4NavigationItem(
                  icon: item.icon,
                  label: item.label,
                  isSelected: index == selectedIndex,
                  badge: item.badge,
                  onTap: () => onItemSelected?.call(index),
                );
              },
            ),
          ),
          if (footer != null) footer!,
        ],
      ),
    );
  }
}

/// Datos de un ítem del cajón de navegación
class Pragma4NavigationDrawerItem {
  const Pragma4NavigationDrawerItem({
    required this.icon,
    required this.label,
    this.badge,
  });

  final IconData icon;
  final String label;
  final Widget? badge;
}
