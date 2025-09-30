import 'package:flutter/material.dart';

/// Molécula de grupo de botones para acciones relacionadas
class Pragma4ButtonGroup extends StatelessWidget {
  const Pragma4ButtonGroup({
    super.key,
    required this.buttons,
    this.direction = Axis.horizontal,
    this.spacing = 8.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
  });

  final List<Widget> buttons;
  final Axis direction;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    if (direction == Axis.horizontal) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: _buildChildren(),
      );
    } else {
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: _buildChildren(),
      );
    }
  }

  List<Widget> _buildChildren() {
    final children = <Widget>[];

    for (int i = 0; i < buttons.length; i++) {
      children.add(buttons[i]);

      if (i < buttons.length - 1) {
        children.add(
          direction == Axis.horizontal
              ? SizedBox(width: spacing)
              : SizedBox(height: spacing),
        );
      }
    }

    return children;
  }
}

/// Grupo de botones segmentados para selección única
class Pragma4SegmentedButtonGroup<T> extends StatelessWidget {
  const Pragma4SegmentedButtonGroup({
    super.key,
    required this.segments,
    required this.selected,
    required this.onSelectionChanged,
    this.multipleSelection = false,
  });

  final List<Pragma4SegmentedButtonItem<T>> segments;
  final Set<T> selected;
  final ValueChanged<Set<T>> onSelectionChanged;
  final bool multipleSelection;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<T>(
      segments: segments.map((item) {
        return ButtonSegment<T>(
          value: item.value,
          label: Text(item.label),
          icon: item.icon != null ? Icon(item.icon) : null,
        );
      }).toList(),
      selected: selected,
      onSelectionChanged: onSelectionChanged,
      multiSelectionEnabled: multipleSelection,
    );
  }
}

/// Ítem de botón segmentado
class Pragma4SegmentedButtonItem<T> {
  const Pragma4SegmentedButtonItem({
    required this.value,
    required this.label,
    this.icon,
  });

  final T value;
  final String label;
  final IconData? icon;
}
