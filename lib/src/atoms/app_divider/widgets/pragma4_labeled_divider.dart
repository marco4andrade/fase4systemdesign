import 'package:flutter/material.dart';
import '../pragma4_divider.dart';
import '../styles/pragma4_divider_styles.dart';

/// Divisor con texto/etiqueta
class Pragma4LabeledDivider extends StatelessWidget {
  const Pragma4LabeledDivider({
    super.key,
    required this.label,
    this.color,
    this.thickness,
    this.spacing,
    this.labelStyle,
  });

  final String label;
  final Color? color;
  final double? thickness;
  final double? spacing;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final dividerColor = color ?? Pragma4DividerStyles.getDefaultColor();
    final dividerThickness = thickness ?? Pragma4DividerStyles.getDefaultThickness();
    final dividerSpacing = spacing ?? Pragma4DividerStyles.getDefaultSpacing();
    final textStyle = labelStyle ?? Pragma4DividerStyles.getDefaultLabelStyle(context);

    return Padding(
      padding: Pragma4DividerStyles.getHorizontalPadding(dividerSpacing),
      child: Row(
        children: [
          Expanded(
            child: Pragma4Divider(
              color: dividerColor, 
              thickness: dividerThickness,
              spacing: 0, // Sin spacing interno para evitar doble padding
            ),
          ),
          Padding(
            padding: Pragma4DividerStyles.getLabelPadding(),
            child: Text(label, style: textStyle),
          ),
          Expanded(
            child: Pragma4Divider(
              color: dividerColor, 
              thickness: dividerThickness,
              spacing: 0, // Sin spacing interno para evitar doble padding
            ),
          ),
        ],
      ),
    );
  }
}