import 'package:flutter/material.dart';
import '../../enums/enums.dart';
import 'styles/pragma4_divider_styles.dart';

/// Componente divisor atómico para separar contenido
/// Divisor básico que soporta orientación horizontal o vertical.
class Pragma4Divider extends StatelessWidget {
  const Pragma4Divider({
    super.key,
    this.orientation = Pragma4ComponentOrientation.horizontal,
    this.color,
    this.thickness,
    this.spacing,
    this.indent = 0,
    this.endIndent = 0,
  });

  final Pragma4ComponentOrientation orientation;
  final Color? color;
  final double? thickness;
  final double? spacing;
  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    final dividerColor = color ?? Pragma4DividerStyles.getDefaultColor();
    final dividerThickness = thickness ?? Pragma4DividerStyles.getDefaultThickness();
    final dividerSpacing = spacing ?? Pragma4DividerStyles.getDefaultSpacing();

    if (orientation == Pragma4ComponentOrientation.horizontal) {
      return Padding(
        padding: Pragma4DividerStyles.getHorizontalPadding(dividerSpacing),
        child: Divider(
          color: dividerColor,
          thickness: dividerThickness,
          indent: indent,
          endIndent: endIndent,
          height: 0,
        ),
      );
    }

    return Padding(
      padding: Pragma4DividerStyles.getVerticalPadding(dividerSpacing),
      child: VerticalDivider(
        color: dividerColor,
        thickness: dividerThickness,
        indent: indent,
        endIndent: endIndent,
        width: 0,
      ),
    );
  }
}