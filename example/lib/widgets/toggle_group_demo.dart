import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';

/// Widget de demostración para el componente ToggleGroup
/// Muestra cómo usar el toggle group con múltiples selecciones
class ToggleGroupDemo extends StatefulWidget {
  const ToggleGroupDemo({super.key});

  @override
  State<ToggleGroupDemo> createState() => _ToggleGroupDemoState();
}

class _ToggleGroupDemoState extends State<ToggleGroupDemo> {
  final _items = const [
    Pragma4ToggleItem(value: 'a', label: 'Opción A'),
    Pragma4ToggleItem(value: 'b', label: 'Opción B'),
    Pragma4ToggleItem(value: 'c', label: 'Opción C'),
  ];

  Set<String> _selected = {'a'};

  void _onChange(Set<String> newSel) {
    setState(() => _selected = newSel);
  }

  @override
  Widget build(BuildContext context) {
    return Pragma4ToggleGroup<String>(
      items: _items,
      selectedItems: _selected,
      onSelectionChanged: _onChange,
      multiSelect: true,
    );
  }
}