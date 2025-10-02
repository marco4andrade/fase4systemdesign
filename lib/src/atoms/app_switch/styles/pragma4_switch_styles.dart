import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../enums/enums.dart';

/// Helper de estilos para componentes de switch
class Pragma4SwitchStyles {
  Pragma4SwitchStyles._();

  /// Obtiene la escala del switch según el tamaño especificado
  static double getScale(Pragma4ComponentSize size) {
    switch (size) {
      case Pragma4ComponentSize.small:
        return 0.8;
      case Pragma4ComponentSize.medium:
        return 1.0;
      case Pragma4ComponentSize.large:
      case Pragma4ComponentSize.xlarge:
        return 1.2;
    }
  }

  /// Obtiene el color del thumb según el estado
  static WidgetStateProperty<Color?> getThumbColor({
    required bool value,
    Color? thumbColor,
  }) {
    return WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.disabled)) {
        return thumbColor?.withValues(alpha: 0.7) ?? Pragma4Colors.grey300;
      }
      if (value) {
        return thumbColor ?? Pragma4Colors.onPrimary;
      }
      return thumbColor ?? Pragma4Colors.surface;
    });
  }

  /// Obtiene el color del track según el estado
  static WidgetStateProperty<Color?> getTrackColor({
    required bool value,
    Color? activeColor,
    Color? inactiveColor,
  }) {
    return WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.disabled)) {
        return Pragma4Colors.grey200;
      }
      if (value) {
        return activeColor ?? Pragma4Colors.primary;
      }
      return inactiveColor ?? Pragma4Colors.grey300;
    });
  }

  /// Obtiene el color del borde del track
  static WidgetStateProperty<Color?> getTrackOutlineColor() {
    return WidgetStateProperty.resolveWith<Color?>(
      (states) => states.contains(WidgetState.disabled)
          ? Pragma4Colors.grey200
          : null,
    );
  }
}