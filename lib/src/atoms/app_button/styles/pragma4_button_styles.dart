import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../enums/enums.dart';

/// Helper class para manejar todos los estilos del botón
class Pragma4ButtonStyles {
  const Pragma4ButtonStyles._();

  /// Obtiene el color de fondo según la variante
  static Color getBackgroundColor(Pragma4ComponentVariant variant) {
    switch (variant) {
      case Pragma4ComponentVariant.primary:
        return Pragma4Colors.primary;
      case Pragma4ComponentVariant.secondary:
        return Pragma4Colors.secondaryLight.withValues(alpha: 0.20);
      case Pragma4ComponentVariant.outline:
      case Pragma4ComponentVariant.ghost:
        return Colors.transparent;
      case Pragma4ComponentVariant.danger:
        return Pragma4Colors.error;
      default:
        return Pragma4Colors.primary;
    }
  }

  /// Obtiene el color del texto según la variante
  static Color getTextColor(Pragma4ComponentVariant variant) {
    switch (variant) {
      case Pragma4ComponentVariant.primary:
        return Pragma4Colors.onPrimary;
      case Pragma4ComponentVariant.secondary:
        return Pragma4Colors.secondaryDark;
      case Pragma4ComponentVariant.outline:
        return Pragma4Colors.primary;
      case Pragma4ComponentVariant.ghost:
        return Pragma4Colors.primary;
      case Pragma4ComponentVariant.danger:
        return Pragma4Colors.onError;
      default:
        return Pragma4Colors.onPrimary;
    }
  }

  /// Obtiene el color deshabilitado según la variante
  static Color getDisabledColor(Pragma4ComponentVariant variant) {
    switch (variant) {
      case Pragma4ComponentVariant.primary:
        return Pragma4Colors.primary.withValues(alpha: 0.45);
      case Pragma4ComponentVariant.secondary:
        return Pragma4Colors.secondary.withValues(alpha: 0.45);
      case Pragma4ComponentVariant.danger:
        return Pragma4Colors.error.withValues(alpha: 0.45);
      case Pragma4ComponentVariant.outline:
      case Pragma4ComponentVariant.ghost:
        return Colors.transparent;
      default:
        return Pragma4Colors.primary.withValues(alpha: 0.45);
    }
  }

  /// Obtiene el color del texto deshabilitado según la variante
  static Color getDisabledTextColor(Pragma4ComponentVariant variant) {
    switch (variant) {
      case Pragma4ComponentVariant.primary:
        return Pragma4Colors.onPrimary.withValues(alpha: 0.6);
      case Pragma4ComponentVariant.secondary:
        return Pragma4Colors.onSecondary.withValues(alpha: 0.6);
      case Pragma4ComponentVariant.danger:
        return Pragma4Colors.onError.withValues(alpha: 0.6);
      case Pragma4ComponentVariant.outline:
      case Pragma4ComponentVariant.ghost:
        return Pragma4Colors.primary.withValues(alpha: 0.4);
      default:
        return Pragma4Colors.onPrimary.withValues(alpha: 0.6);
    }
  }

  /// Obtiene el borde según la variante
  static BorderSide getBorderSide(Pragma4ComponentVariant variant) {
    switch (variant) {
      case Pragma4ComponentVariant.outline:
        return BorderSide(color: Pragma4Colors.primary, width: 1);
      case Pragma4ComponentVariant.danger:
        if (variant == Pragma4ComponentVariant.outline) {
          return BorderSide(color: Pragma4Colors.error, width: 1);
        }
        return BorderSide.none;
      case Pragma4ComponentVariant.secondary:
        return BorderSide(
          color: Pragma4Colors.secondary.withValues(alpha: 0.6),
          width: 1,
        );
      default:
        return BorderSide.none;
    }
  }

  /// Obtiene la elevación según la variante
  static double getElevation(Pragma4ComponentVariant variant) {
    switch (variant) {
      case Pragma4ComponentVariant.primary:
      case Pragma4ComponentVariant.danger:
        return 2.0;
      case Pragma4ComponentVariant.secondary:
        return 0.0;
      case Pragma4ComponentVariant.outline:
      case Pragma4ComponentVariant.ghost:
        return 0.0;
      default:
        return 0.0;
    }
  }

  /// Obtiene la elevación al presionar
  static double getHighlightElevation(Pragma4ComponentVariant variant) {
    return getElevation(variant) + 2;
  }

  /// Obtiene el radio del borde según el tamaño
  static double getBorderRadius(Pragma4ComponentSize size) {
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

  /// Obtiene el padding según el tamaño
  static EdgeInsets getPadding(Pragma4ComponentSize size) {
    switch (size) {
      case Pragma4ComponentSize.small:
        return const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
      case Pragma4ComponentSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
      case Pragma4ComponentSize.large:
        return const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0);
      case Pragma4ComponentSize.xlarge:
        return const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0);
    }
  }

  /// Obtiene el ancho mínimo según el tamaño
  static double getMinWidth(Pragma4ComponentSize size) {
    switch (size) {
      case Pragma4ComponentSize.small:
        return 64;
      case Pragma4ComponentSize.medium:
        return 88;
      case Pragma4ComponentSize.large:
        return 120;
      case Pragma4ComponentSize.xlarge:
        return 150;
    }
  }

  /// Obtiene la altura según el tamaño
  static double getHeight(Pragma4ComponentSize size) {
    switch (size) {
      case Pragma4ComponentSize.small:
        return 32;
      case Pragma4ComponentSize.medium:
        return 40;
      case Pragma4ComponentSize.large:
        return 48;
      case Pragma4ComponentSize.xlarge:
        return 56;
    }
  }

  /// Obtiene el estilo de texto según el tamaño
  static TextStyle getTextStyle(Pragma4ComponentSize size) {
    switch (size) {
      case Pragma4ComponentSize.small:
        return Pragma4Typography.buttonSmall;
      case Pragma4ComponentSize.medium:
        return Pragma4Typography.buttonMedium;
      case Pragma4ComponentSize.large:
        return Pragma4Typography.buttonLarge;
      case Pragma4ComponentSize.xlarge:
        return Pragma4Typography.buttonLarge; // Usar mismo estilo que large
    }
  }

  /// Obtiene el tamaño del loading indicator según el tamaño del botón
  static double getLoadingSize(Pragma4ComponentSize size) {
    switch (size) {
      case Pragma4ComponentSize.small:
        return 14;
      case Pragma4ComponentSize.medium:
        return 16;
      case Pragma4ComponentSize.large:
        return 18;
      case Pragma4ComponentSize.xlarge:
        return 20;
    }
  }

  /// Obtiene el espaciado entre icono y texto
  static double getIconSpacing() {
    return 4.0;
  }
}