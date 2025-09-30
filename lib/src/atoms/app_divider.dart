import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Orientaciones del divisor
// Orientación del divisor.
enum Pragma4DividerOrientation { horizontal, vertical }

/// Componente divisor atómico para separar contenido
/// Divisor básico que soporta orientación horizontal o vertical.
class Pragma4Divider extends StatelessWidget {
  const Pragma4Divider({
    super.key,
    this.orientation = Pragma4DividerOrientation.horizontal,
    this.color,
    this.thickness = 1,
    this.spacing = 16.0, // md
    this.indent = 0,
    this.endIndent = 0,
  });

  final Pragma4DividerOrientation orientation;
  final Color? color;
  final double thickness;
  final double spacing;
  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    final dividerColor = color ?? Pragma4Colors.grey200;
    if (orientation == Pragma4DividerOrientation.horizontal) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: spacing / 2),
        child: Divider(
          color: dividerColor,
          thickness: thickness,
          indent: indent,
          endIndent: endIndent,
          height: 0,
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing / 2),
      child: VerticalDivider(
        color: dividerColor,
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
        width: 0,
      ),
    );
  }
}

/// Divisor con texto/etiqueta
class Pragma4LabeledDivider extends StatelessWidget {
  const Pragma4LabeledDivider({
    super.key,
    required this.label,
    this.color,
    this.thickness = 1,
    this.spacing = 16.0, // md
    this.labelStyle,
  });

  final String label;
  final Color? color;
  final double thickness;
  final double spacing;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final dividerColor = color ?? Pragma4Colors.grey200;
    final textStyle =
        labelStyle ??
        Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: Pragma4Colors.onSurfaceVariant);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing / 2),
      child: Row(
        children: [
          Expanded(
            child: Pragma4Divider(color: dividerColor, thickness: thickness),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // md
            child: Text(label, style: textStyle),
          ),
          Expanded(
            child: Pragma4Divider(color: dividerColor, thickness: thickness),
          ),
        ],
      ),
    );
  }
}

