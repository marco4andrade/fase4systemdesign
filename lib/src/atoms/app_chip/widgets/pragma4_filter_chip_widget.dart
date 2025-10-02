import 'package:flutter/material.dart';
import '../../../enums/enums.dart';
import '../styles/pragma4_chip_styles.dart';

/// Chip de filtro para selecciones con estado
class Pragma4FilterChipInternal extends StatelessWidget {
  const Pragma4FilterChipInternal({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
    this.avatar,
    this.variant = Pragma4ComponentVariant.filled,
    this.backgroundColor,
    this.selectedColor,
    this.labelColor,
  });

  final String label;
  final bool isSelected;
  final ValueChanged<bool> onSelected;
  final Widget? avatar;
  final Pragma4ComponentVariant variant;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        label,
        style: Pragma4ChipStyles.getLabelStyle(
          labelColor: labelColor,
          isSelected: isSelected,
        ),
      ),
      avatar: avatar,
      selected: isSelected,
      onSelected: onSelected,
      backgroundColor: Pragma4ChipStyles.getBackgroundColor(
        variant,
        isSelected: isSelected,
        backgroundColor: backgroundColor,
        selectedColor: selectedColor,
      ),
      selectedColor: selectedColor ?? Pragma4ChipStyles.getDefaultSelectedColor(),
      labelStyle: Pragma4ChipStyles.getLabelStyle(
        labelColor: labelColor,
        isSelected: isSelected,
      ),
      side: Pragma4ChipStyles.getBorderSide(variant),
      elevation: Pragma4ChipStyles.getElevation(variant),
      padding: Pragma4ChipStyles.getPadding(),
      shape: Pragma4ChipStyles.getShape(),
    );
  }
}