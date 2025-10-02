import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../enums/enums.dart';

/// Insignia de punto para notificaciones
class Pragma4DotBadge extends StatelessWidget {
  const Pragma4DotBadge({
    super.key,
    this.variant = Pragma4ComponentVariant.danger,
    this.size = 8,
  });

  final Pragma4ComponentVariant variant;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: _getColor(), shape: BoxShape.circle),
    );
  }

  Color _getColor() {
    switch (variant) {
      case Pragma4ComponentVariant.primary:
        return Pragma4Colors.primary;
      case Pragma4ComponentVariant.secondary:
        return Pragma4Colors.secondary;
      case Pragma4ComponentVariant.success:
        return Pragma4Colors.success;
      case Pragma4ComponentVariant.warning:
        return Pragma4Colors.warning;
      case Pragma4ComponentVariant.danger:
        return Pragma4Colors.error;
      case Pragma4ComponentVariant.info:
        return Pragma4Colors.info;
      default:
        return Pragma4Colors.grey500;
    }
  }
}