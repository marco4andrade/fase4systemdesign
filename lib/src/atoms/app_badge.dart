import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../enums/enums.dart';

/// Componente de insignia atómico para indicadores de estado y etiquetas
class Pragma4Badge extends StatelessWidget {
  const Pragma4Badge({
    super.key,
    required this.text,
    this.variant = Pragma4ComponentVariant.primary,
    this.size = Pragma4ComponentSize.medium,
    this.icon,
    this.onTap,
  });

  final String text;
  final Pragma4ComponentVariant variant;
  final Pragma4ComponentSize size;
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
            Icon(icon, size: _getIconSize(), color: _getTextColor()),
            SizedBox(width: _getIconSpacing()),
          ],
          Text(text, style: _getTextStyle().copyWith(color: _getTextColor())),
        ],
      ),
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: badgeWidget);
    }

    return badgeWidget;
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case Pragma4ComponentSize.small:
        return const EdgeInsets.symmetric(
          horizontal: 4.0, // xs
          vertical: 2,
        );
      case Pragma4ComponentSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: 8.0, // sm
          vertical: 4.0, // xs
        );
      case Pragma4ComponentSize.large:
      case Pragma4ComponentSize.xlarge:
        return const EdgeInsets.symmetric(
          horizontal: 16.0, // md
          vertical: 8.0, // sm
        );
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case Pragma4ComponentSize.small:
        return 2.0; // radiusXs
      case Pragma4ComponentSize.medium:
        return 4.0; // radiusSm
      case Pragma4ComponentSize.large:
      case Pragma4ComponentSize.xlarge:
        return 8.0; // radiusMd
    }
  }

  Color _getBackgroundColor() {
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

  Color _getTextColor() {
    switch (variant) {
      case Pragma4ComponentVariant.primary:
        return Pragma4Colors.onPrimary;
      case Pragma4ComponentVariant.secondary:
        return Pragma4Colors.onSecondary;
      case Pragma4ComponentVariant.success:
      case Pragma4ComponentVariant.warning:
      case Pragma4ComponentVariant.danger:
      case Pragma4ComponentVariant.info:
        return Colors.white;
      default:
        return Colors.white;
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case Pragma4ComponentSize.small:
        return Pragma4Typography.labelSmall;
      case Pragma4ComponentSize.medium:
        return Pragma4Typography.labelMedium;
      case Pragma4ComponentSize.large:
      case Pragma4ComponentSize.xlarge:
        return Pragma4Typography.labelLarge;
    }
  }

  double _getIconSize() {
    return size.iconSize;
  }

  double _getIconSpacing() {
    return 4.0; // xs
  }
}

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

/// Insignia numérica para conteos
class Pragma4NumberBadge extends StatelessWidget {
  const Pragma4NumberBadge({
    super.key,
    required this.count,
    this.variant = Pragma4ComponentVariant.danger,
    this.maxCount = 99,
  });

  final int count;
  final Pragma4ComponentVariant variant;
  final int maxCount;

  @override
  Widget build(BuildContext context) {
    final displayText = count > maxCount ? '$maxCount+' : count.toString();

    return Pragma4Badge(
      text: displayText,
      variant: variant,
      size: Pragma4ComponentSize.small,
    );
  }
}
