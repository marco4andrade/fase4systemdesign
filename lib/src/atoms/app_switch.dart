import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../enums/enums.dart';

/// Componente de interruptor atómico para valores booleanos
class Pragma4Switch extends StatelessWidget {
  const Pragma4Switch({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = Pragma4ComponentSize.medium,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.isDisabled = false,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Pragma4ComponentSize size;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _getScale(),
      child: Switch(
        value: value,
        onChanged: isDisabled ? null : onChanged,
        thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return thumbColor?.withValues(alpha: 0.7) ?? Pragma4Colors.grey300;
          }
          if (value) {
            return thumbColor ?? Pragma4Colors.onPrimary;
          }
          return thumbColor ?? Pragma4Colors.surface;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return Pragma4Colors.grey200;
          }
          if (value) {
            return activeColor ?? Pragma4Colors.primary;
          }
          return inactiveColor ?? Pragma4Colors.grey300;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
          (states) => states.contains(WidgetState.disabled)
              ? Pragma4Colors.grey200
              : null,
        ),
      ),
    );
  }

  double _getScale() {
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
}
