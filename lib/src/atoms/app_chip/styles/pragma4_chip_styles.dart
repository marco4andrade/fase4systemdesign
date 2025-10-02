import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../enums/enums.dart';

/// Helper class para manejar todos los estilos del chip
class Pragma4ChipStyles {
  const Pragma4ChipStyles._();

  /// Obtiene el color de fondo según la variante y estado
  static Color getBackgroundColor(
    Pragma4ComponentVariant variant, {
    bool isSelected = false,
    Color? backgroundColor,
    Color? selectedColor,
  }) {
    if (isSelected && selectedColor != null) {
      return selectedColor;
    }

    if (backgroundColor != null) {
      return backgroundColor;
    }

    switch (variant) {
      case Pragma4ComponentVariant.filled:
        return Pragma4Colors.surfaceVariant;
      case Pragma4ComponentVariant.outlined:
        return Colors.transparent;
      case Pragma4ComponentVariant.primary:
        return Pragma4Colors.surface;
      default:
        return Pragma4Colors.surfaceVariant;
    }
  }

  /// Obtiene el estilo del texto de la etiqueta
  static TextStyle getLabelStyle({Color? labelColor, bool isSelected = false}) {
    return Pragma4Typography.labelMedium.copyWith(
      color: labelColor ?? getLabelColor(isSelected: isSelected),
    );
  }

  /// Obtiene el color del texto de la etiqueta
  static Color getLabelColor({bool isSelected = false}) {
    if (isSelected) {
      return Pragma4Colors.onPrimary;
    }
    return Pragma4Colors.onSurface;
  }

  /// Obtiene el borde según la variante
  static BorderSide? getBorderSide(Pragma4ComponentVariant variant) {
    switch (variant) {
      case Pragma4ComponentVariant.outlined:
        return const BorderSide(color: Pragma4Colors.grey300);
      case Pragma4ComponentVariant.filled:
      case Pragma4ComponentVariant.primary:
      default:
        return null;
    }
  }

  /// Obtiene la elevación según la variante
  static double getElevation(Pragma4ComponentVariant variant) {
    switch (variant) {
      case Pragma4ComponentVariant.primary:
        return 2;
      case Pragma4ComponentVariant.filled:
      case Pragma4ComponentVariant.outlined:
      default:
        return 0;
    }
  }

  /// Obtiene el padding del chip
  static EdgeInsets getPadding() {
    return const EdgeInsets.symmetric(
      horizontal: 8.0, // sm
      vertical: 4.0, // xs
    );
  }

  /// Obtiene la forma del chip
  static OutlinedBorder getShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0), // radiusRound
    );
  }

  /// Obtiene el color por defecto para el ícono de eliminación
  static Color getDefaultDeleteIconColor() {
    return Pragma4Colors.onSurfaceVariant;
  }

  /// Obtiene el color seleccionado por defecto
  static Color getDefaultSelectedColor() {
    return Pragma4Colors.primary;
  }
}