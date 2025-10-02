import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../enums/enums.dart';

/// Helper class para manejar todos los estilos de iconos
class Pragma4IconStyles {
  const Pragma4IconStyles._();

  /// Obtiene el tamaño del icono según el tamaño del componente
  static double getIconSize(Pragma4ComponentSize size) {
    return size.iconSize;
  }

  /// Obtiene el color del icono con prioridad: color > semanticColor > theme default
  static Color? getIconColor({
    Color? color,
    Color? semanticColor,
  }) {
    if (color != null) return color;
    if (semanticColor != null) return semanticColor;
    return null; // Usar valor por defecto del tema
  }

  /// Obtiene el color del icono deshabilitado
  static Color getDisabledIconColor() {
    return Pragma4Colors.grey400;
  }

  /// Obtiene el radio del borde por defecto para botones de icono
  static double getDefaultBorderRadius(Pragma4ComponentSize size) {
    switch (size) {
      case Pragma4ComponentSize.small:
        return 4.0;
      case Pragma4ComponentSize.medium:
        return 6.0;
      case Pragma4ComponentSize.large:
        return 8.0;
      case Pragma4ComponentSize.xlarge:
        return 10.0;
    }
  }

  /// Obtiene el padding para botones de icono
  static double getPadding(Pragma4ComponentSize size) {
    switch (size) {
      case Pragma4ComponentSize.small:
        return 4.0;
      case Pragma4ComponentSize.medium:
        return 8.0;
      case Pragma4ComponentSize.large:
        return 12.0;
      case Pragma4ComponentSize.xlarge:
        return 16.0;
    }
  }

  /// Obtiene el color de fondo transparente por defecto
  static Color getDefaultBackgroundColor() {
    return Colors.transparent;
  }
}