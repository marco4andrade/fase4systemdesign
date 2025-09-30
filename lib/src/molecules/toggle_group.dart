import 'package:flutter/material.dart';
import '../atoms/atoms.dart';

/// Molécula de grupo de toggles para múltiples selecciones
class Pragma4ToggleGroup<T> extends StatelessWidget {
  const Pragma4ToggleGroup({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onSelectionChanged,
    this.multiSelect = false,
    this.direction = Axis.horizontal,
  this.spacing = 8.0,
  });

  final List<Pragma4ToggleItem<T>> items;
  final Set<T> selectedItems;
  final ValueChanged<Set<T>> onSelectionChanged;
  final bool multiSelect;
  final Axis direction;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: direction,
      spacing: spacing,
      runSpacing: spacing,
      children: items.map((item) {
        final isSelected = selectedItems.contains(item.value);
        
        return Pragma4Chip(
          label: item.label,
          avatar: item.icon != null ? Icon(item.icon, size: 16) : null,
          isSelected: isSelected,
          onPressed: () => _handleSelection(item.value),
        );
      }).toList(),
    );
  }

  void _handleSelection(T value) {
    final newSelection = Set<T>.from(selectedItems);
    
    if (selectedItems.contains(value)) {
      newSelection.remove(value);
    } else {
      if (!multiSelect) {
        newSelection.clear();
      }
      newSelection.add(value);
    }
    
    onSelectionChanged(newSelection);
  }
}

/// Datos de un toggle
class Pragma4ToggleItem<T> {
  const Pragma4ToggleItem({
    required this.value,
    required this.label,
    this.icon,
  });

  final T value;
  final String label;
  final IconData? icon;
}

// Compatibilidad temporal
typedef ToggleGroup<T> = Pragma4ToggleGroup<T>;
typedef ToggleItem<T> = Pragma4ToggleItem<T>;