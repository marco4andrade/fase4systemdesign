import 'package:flutter/material.dart';
import '../../../enums/enums.dart';
import '../styles/pragma4_chip_styles.dart';

/// Chip de acción simple sin interacciones
class Pragma4ActionChip extends StatelessWidget {
  const Pragma4ActionChip({
    super.key,
    required this.label,
    this.avatar,
    this.variant = Pragma4ComponentVariant.filled,
    this.backgroundColor,
    this.labelColor,
  });

  final String label;
  final Widget? avatar;
  final Pragma4ComponentVariant variant;
  final Color? backgroundColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(
        label,
        style: Pragma4ChipStyles.getLabelStyle(
          labelColor: labelColor,
          isSelected: false,
        ),
      ),
      avatar: avatar,
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