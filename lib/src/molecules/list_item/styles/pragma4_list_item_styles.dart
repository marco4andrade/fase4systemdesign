import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_shadows.dart';

/// Helper de estilos para componentes de lista
class Pragma4ListItemStyles {
  Pragma4ListItemStyles._();

  /// Obtiene el color de fondo efectivo según el estado
  static Color getEffectiveBackgroundColor({
    required bool selected,
    Color? backgroundColor,
  }) {
    return selected
        ? Pragma4Colors.primaryLight.withValues(alpha: 0.1)
        : (backgroundColor ?? Colors.transparent);
  }

  /// Construye la decoración del item de lista
  static BoxDecoration buildListItemDecoration({
    required Color effectiveBackground,
    required double borderRadius,
    required bool showDecoration,
    Color? borderColor,
    required double borderWidth,
    required double elevation,
  }) {
    return BoxDecoration(
      color: effectiveBackground,
      borderRadius: BorderRadius.circular(borderRadius),
      border: showDecoration && borderColor != null
          ? Border.all(color: borderColor, width: borderWidth)
          : null,
      boxShadow: showDecoration && elevation > 0 ? getShadow(elevation) : null,
    );
  }

  /// Obtiene la sombra según el nivel de elevación
  static List<BoxShadow> getShadow(double elevation) {
    if (elevation <= 1) return Pragma4Shadows.sm;
    if (elevation <= 3) return Pragma4Shadows.md;
    if (elevation <= 6) return Pragma4Shadows.lg;
    return Pragma4Shadows.xl;
  }

  /// Obtiene el padding de contenido estándar
  static EdgeInsets getContentPadding() {
    return const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 4.0,
    );
  }
}