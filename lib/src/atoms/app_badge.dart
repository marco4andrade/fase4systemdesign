import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Variantes de insignia (badge)
enum Pragma4BadgeVariant {
  primary,
  secondary,
  success,
  warning,
  error,
  info,
  neutral,
}

/// Tamaños de insignia
const String pragma4BadgeSizeSmall = 'small';
const String pragma4BadgeSizeMedium = 'medium';
const String pragma4BadgeSizeLarge = 'large';

/// Componente de insignia atómico para indicadores de estado y etiquetas
class Pragma4Badge extends StatelessWidget {
  const Pragma4Badge({
    super.key,
    required this.text,
    this.variant = Pragma4BadgeVariant.primary,
    this.size = pragma4BadgeSizeMedium,
    this.icon,
    this.onTap,
  });

  final String text;
  final Pragma4BadgeVariant variant;
  final String size;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final badgeWidget = Container(
      padding: _getPadding(),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(_getBorderRadius()),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: _getIconSize(),
              color: _getTextColor(),
            ),
            SizedBox(width: _getIconSpacing()),
          ],
          Text(
            text,
            style: _getTextStyle().copyWith(
              color: _getTextColor(),
            ),
          ),
        ],
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: badgeWidget,
      );
    }

    return badgeWidget;
  }

  EdgeInsets _getPadding() {
    if (size == pragma4BadgeSizeSmall) {
      return const EdgeInsets.symmetric(
        horizontal: 4.0, // xs
        vertical: 2,
      );
    }
    if (size == pragma4BadgeSizeMedium) {
      return const EdgeInsets.symmetric(
        horizontal: 8.0, // sm
        vertical: 4.0, // xs
      );
    }
    // large
    return const EdgeInsets.symmetric(
      horizontal: 16.0, // md
      vertical: 8.0, // sm
    );
  }

  double _getBorderRadius() {
    if (size == pragma4BadgeSizeSmall) return 2.0; // radiusXs
    if (size == pragma4BadgeSizeMedium) return 4.0; // radiusSm
    return 8.0; // radiusMd
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case Pragma4BadgeVariant.primary:
        return Pragma4Colors.primary;
      case Pragma4BadgeVariant.secondary:
        return Pragma4Colors.secondary;
      case Pragma4BadgeVariant.success:
        return Pragma4Colors.success;
      case Pragma4BadgeVariant.warning:
        return Pragma4Colors.warning;
      case Pragma4BadgeVariant.error:
        return Pragma4Colors.error;
      case Pragma4BadgeVariant.info:
        return Pragma4Colors.info;
      case Pragma4BadgeVariant.neutral:
        return Pragma4Colors.grey500;
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case Pragma4BadgeVariant.primary:
        return Pragma4Colors.onPrimary;
      case Pragma4BadgeVariant.secondary:
        return Pragma4Colors.onSecondary;
  case Pragma4BadgeVariant.success:
  case Pragma4BadgeVariant.warning:
  case Pragma4BadgeVariant.error:
  case Pragma4BadgeVariant.info:
        return Colors.white;
  case Pragma4BadgeVariant.neutral:
        return Colors.white;
    }
  }

  TextStyle _getTextStyle() {
    if (size == pragma4BadgeSizeSmall) return Pragma4Typography.labelSmall;
    if (size == pragma4BadgeSizeMedium) return Pragma4Typography.labelMedium;
    return Pragma4Typography.labelLarge;
  }

  double _getIconSize() {
    if (size == pragma4BadgeSizeSmall) return 12;
    if (size == pragma4BadgeSizeMedium) return 14;
    return 16;
  }

  double _getIconSpacing() {
    return 4.0; // xs
  }
}

/// Insignia de punto para notificaciones
class Pragma4DotBadge extends StatelessWidget {
  const Pragma4DotBadge({
    super.key,
  this.variant = Pragma4BadgeVariant.error,
    this.size = 8,
  });

  final Pragma4BadgeVariant variant;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _getColor(),
        shape: BoxShape.circle,
      ),
    );
  }

  Color _getColor() {
    switch (variant) {
      case Pragma4BadgeVariant.primary:
        return Pragma4Colors.primary;
      case Pragma4BadgeVariant.secondary:
        return Pragma4Colors.secondary;
      case Pragma4BadgeVariant.success:
        return Pragma4Colors.success;
      case Pragma4BadgeVariant.warning:
        return Pragma4Colors.warning;
      case Pragma4BadgeVariant.error:
        return Pragma4Colors.error;
      case Pragma4BadgeVariant.info:
        return Pragma4Colors.info;
      case Pragma4BadgeVariant.neutral:
        return Pragma4Colors.grey500;
    }
  }
}

/// Insignia numérica para conteos
class Pragma4NumberBadge extends StatelessWidget {
  const Pragma4NumberBadge({
    super.key,
    required this.count,
  this.variant = Pragma4BadgeVariant.error,
    this.maxCount = 99,
  });

  final int count;
  final Pragma4BadgeVariant variant;
  final int maxCount;

  @override
  Widget build(BuildContext context) {
    final displayText = count > maxCount ? '$maxCount+' : count.toString();
    
  return Pragma4Badge(
      text: displayText,
      variant: variant,
      size: pragma4BadgeSizeSmall,
    );
  }
}
