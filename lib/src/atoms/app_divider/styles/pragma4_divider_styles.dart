import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

/// Helper class para manejar todos los estilos del divider
class Pragma4DividerStyles {
  const Pragma4DividerStyles._();

  /// Obtiene el color por defecto del divider
  static Color getDefaultColor() {
    return Pragma4Colors.grey200;
  }

  /// Obtiene el grosor por defecto del divider
  static double getDefaultThickness() {
    return 1.0;
  }

  /// Obtiene el espaciado por defecto del divider
  static double getDefaultSpacing() {
    return 16.0; // md
  }

  /// Obtiene el padding vertical para divisores horizontales
  static EdgeInsets getHorizontalPadding(double spacing) {
    return EdgeInsets.symmetric(vertical: spacing / 2);
  }

  /// Obtiene el padding horizontal para divisores verticales
  static EdgeInsets getVerticalPadding(double spacing) {
    return EdgeInsets.symmetric(horizontal: spacing / 2);
  }

  /// Obtiene el padding para el texto en divisores con etiqueta
  static EdgeInsets getLabelPadding() {
    return const EdgeInsets.symmetric(horizontal: 16.0); // md
  }

  /// Obtiene el estilo de texto por defecto para divisores con etiqueta
  static TextStyle? getDefaultLabelStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
      color: Pragma4Colors.onSurfaceVariant,
    );
  }
}