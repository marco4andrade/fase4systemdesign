import 'package:flutter/material.dart';
import '../../../theme/app_typography.dart';
import '../../../theme/app_colors.dart';
import '../../../enums/enums.dart';

/// Helper de estilos para componentes de texto
class Pragma4TextStyles {
  Pragma4TextStyles._();

  /// Obtiene el estilo base según el tipo de texto
  static TextStyle getBaseStyle(Pragma4TextType variant) {
    switch (variant) {
      case Pragma4TextType.displayLarge:
        return Pragma4Typography.displayLarge;
      case Pragma4TextType.displayMedium:
        return Pragma4Typography.displayMedium;
      case Pragma4TextType.displaySmall:
        return Pragma4Typography.displaySmall;
      case Pragma4TextType.headlineLarge:
        return Pragma4Typography.headlineLarge;
      case Pragma4TextType.headlineMedium:
        return Pragma4Typography.headlineMedium;
      case Pragma4TextType.headlineSmall:
        return Pragma4Typography.headlineSmall;
      case Pragma4TextType.titleLarge:
        return Pragma4Typography.headlineLarge; // Usar headlineLarge como título grande
      case Pragma4TextType.titleMedium:
        return Pragma4Typography.headlineMedium; // Usar headlineMedium como título medio
      case Pragma4TextType.titleSmall:
        return Pragma4Typography.headlineSmall; // Usar headlineSmall como título pequeño
      case Pragma4TextType.bodyLarge:
        return Pragma4Typography.bodyLarge;
      case Pragma4TextType.bodyMedium:
        return Pragma4Typography.bodyMedium;
      case Pragma4TextType.bodySmall:
        return Pragma4Typography.bodySmall;
      case Pragma4TextType.labelLarge:
        return Pragma4Typography.labelLarge;
      case Pragma4TextType.labelMedium:
        return Pragma4Typography.labelMedium;
      case Pragma4TextType.labelSmall:
        return Pragma4Typography.labelSmall;
    }
  }

  /// Obtiene el color semántico para el texto
  static Color getSemanticColor(Pragma4ComponentColor semanticColor) {
    switch (semanticColor) {
      case Pragma4ComponentColor.primary:
        return Pragma4Colors.primary;
      case Pragma4ComponentColor.secondary:
        return Pragma4Colors.secondary;
      case Pragma4ComponentColor.neutral:
        return Pragma4Colors.onSurfaceVariant;
      case Pragma4ComponentColor.success:
        return Pragma4Colors.success;
      case Pragma4ComponentColor.warning:
        return Pragma4Colors.warning;
      case Pragma4ComponentColor.danger:
        return Pragma4Colors.error;
      case Pragma4ComponentColor.info:
        return Pragma4Colors.info;
      case Pragma4ComponentColor.muted:
        return Pragma4Colors.onSurfaceVariant.withValues(alpha: 0.6);
      case Pragma4ComponentColor.disabled:
        return Pragma4Colors.onSurfaceVariant.withValues(alpha: 0.4);
      default:
        return Pragma4Colors.primary;
    }
  }

  /// Construye el estilo final del texto con todas las propiedades aplicadas
  static TextStyle buildTextStyle({
    required Pragma4TextType variant,
    Color? color,
    Pragma4ComponentColor? semanticColor,
    FontWeight? fontWeight,
    double? fontSize,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
  }) {
    TextStyle baseStyle = getBaseStyle(variant);

    Color? finalColor = color;
    if (semanticColor != null) {
      finalColor = getSemanticColor(semanticColor);
    }

    return baseStyle.copyWith(
      color: finalColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );
  }
}