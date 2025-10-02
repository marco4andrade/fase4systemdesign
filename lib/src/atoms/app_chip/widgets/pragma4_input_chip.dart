import 'package:flutter/material.dart';
import '../../../enums/enums.dart';
import '../styles/pragma4_chip_styles.dart';

/// Chip de entrada con capacidad de eliminación
class Pragma4InputChip extends StatelessWidget {
  const Pragma4InputChip({
    super.key,
    required this.label,
    required this.onDeleted,
    this.avatar,
    this.variant = Pragma4ComponentVariant.filled,
    this.backgroundColor,
    this.labelColor,
    this.deleteIconColor,
  });

  final String label;
  final VoidCallback onDeleted;
  final Widget? avatar;
  final Pragma4ComponentVariant variant;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? deleteIconColor;

  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: Text(
        label,
        style: Pragma4ChipStyles.getLabelStyle(
          labelColor: labelColor,
          isSelected: false,
        ),
      ),
      avatar: avatar,
      onDeleted: onDeleted,
      deleteIconColor: deleteIconColor ?? Pragma4ChipStyles.getDefaultDeleteIconColor(),
      backgroundColor: Pragma4ChipStyles.getBackgroundColor(
        variant,
        isSelected: false,
        backgroundColor: backgroundColor,
      ),
      labelStyle: Pragma4ChipStyles.getLabelStyle(
        labelColor: labelColor,
        isSelected: false,
      ),
      side: Pragma4ChipStyles.getBorderSide(variant),
      elevation: Pragma4ChipStyles.getElevation(variant),
      padding: Pragma4ChipStyles.getPadding(),
      shape: Pragma4ChipStyles.getShape(),
    );
  }
}