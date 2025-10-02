import 'package:flutter/material.dart';
import '../../enums/enums.dart';
import 'widgets/pragma4_filter_chip_widget.dart';
import 'widgets/pragma4_input_chip.dart';
import 'widgets/pragma4_action_chip.dart';

/// Componente de chip atómico que determina el tipo apropiado según los parámetros
class Pragma4Chip extends StatelessWidget {
  const Pragma4Chip({
    super.key,
    String? label,
    String? text,
    this.avatar,
    this.onDeleted,
    this.onPressed,
    this.isSelected = false,
    this.variant = Pragma4ComponentVariant.filled,
    this.backgroundColor,
    this.selectedColor,
    this.labelColor,
    this.deleteIconColor,
  }) : label = label ?? text ?? '';

  final String label;
  final Widget? avatar;
  final VoidCallback? onDeleted;
  final VoidCallback? onPressed;
  final bool isSelected;
  final Pragma4ComponentVariant variant;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? labelColor;
  final Color? deleteIconColor;

  @override
  Widget build(BuildContext context) {
    // Si tiene onPressed, es un FilterChip
    if (onPressed != null) {
      return Pragma4FilterChipInternal(
        label: label,
        isSelected: isSelected,
        onSelected: (_) => onPressed!(),
        avatar: avatar,
        variant: variant,
        backgroundColor: backgroundColor,
        selectedColor: selectedColor,
        labelColor: labelColor,
      );
    }
    
    // Si tiene onDeleted, es un InputChip
    if (onDeleted != null) {
      return Pragma4InputChip(
        label: label,
        onDeleted: onDeleted!,
        avatar: avatar,
        variant: variant,
        backgroundColor: backgroundColor,
        labelColor: labelColor,
        deleteIconColor: deleteIconColor,
      );
    }
    
    // Por defecto es un ActionChip
    return Pragma4ActionChip(
      label: label,
      avatar: avatar,
      variant: variant,
      backgroundColor: backgroundColor,
      labelColor: labelColor,
    );
  }
}