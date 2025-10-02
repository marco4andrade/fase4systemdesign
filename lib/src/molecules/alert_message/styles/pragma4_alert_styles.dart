import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../enums/enums.dart';

/// Helper de estilos para componentes de alerta
class Pragma4AlertStyles {
  Pragma4AlertStyles._();

  /// Obtiene el color de fondo según la variante
  static Color getBackgroundColor(Pragma4AlertVariant variant) {
    switch (variant) {
      case Pragma4AlertVariant.info:
        return Pragma4Colors.info.withValues(alpha: 0.1);
      case Pragma4AlertVariant.success:
        return Pragma4Colors.success.withValues(alpha: 0.1);
      case Pragma4AlertVariant.warning:
        return Pragma4Colors.warning.withValues(alpha: 0.1);
      case Pragma4AlertVariant.error:
        return Pragma4Colors.error.withValues(alpha: 0.1);
    }
  }

  /// Obtiene el color del borde según la variante
  static Color getBorderColor(Pragma4AlertVariant variant) {
    switch (variant) {
      case Pragma4AlertVariant.info:
        return Pragma4Colors.info.withValues(alpha: 0.3);
      case Pragma4AlertVariant.success:
        return Pragma4Colors.success.withValues(alpha: 0.3);
      case Pragma4AlertVariant.warning:
        return Pragma4Colors.warning.withValues(alpha: 0.3);
      case Pragma4AlertVariant.error:
        return Pragma4Colors.error.withValues(alpha: 0.3);
    }
  }

  /// Obtiene el color del texto según la variante
  static Color getTextColor(Pragma4AlertVariant variant) {
    switch (variant) {
      case Pragma4AlertVariant.info:
        return Pragma4Colors.info;
      case Pragma4AlertVariant.success:
        return Pragma4Colors.success;
      case Pragma4AlertVariant.warning:
        return Pragma4Colors.warning;
      case Pragma4AlertVariant.error:
        return Pragma4Colors.error;
    }
  }

  /// Obtiene el color del icono según la variante
  static Color getIconColor(Pragma4AlertVariant variant) {
    return getTextColor(variant);
  }

  /// Obtiene el icono según la variante
  static IconData getIcon(Pragma4AlertVariant variant) {
    switch (variant) {
      case Pragma4AlertVariant.info:
        return Icons.info_outline;
      case Pragma4AlertVariant.success:
        return Icons.check_circle_outline;
      case Pragma4AlertVariant.warning:
        return Icons.warning_outlined;
      case Pragma4AlertVariant.error:
        return Icons.error_outline;
    }
  }

  /// Construye la decoración del contenedor de alerta
  static BoxDecoration buildAlertDecoration(Pragma4AlertVariant variant) {
    return BoxDecoration(
      color: getBackgroundColor(variant),
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(color: getBorderColor(variant), width: 1),
    );
  }
}