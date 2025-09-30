import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Tamaños de ícono
enum Pragma4IconSize {
  small, // 16 px
  medium, // 24 px
  large, // 32 px
  xlarge, // 48 px
}

/// Componente de ícono atómico con tamaño y estilo consistentes
class Pragma4Icon extends StatelessWidget {
  const Pragma4Icon(
    this.icon, {
    super.key,
    this.size = Pragma4IconSize.medium,
    this.color,
    this.semanticColor,
    this.onTap,
  });

  final IconData icon;
  final Pragma4IconSize size;
  final Color? color;
  final Color? semanticColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(
      icon,
      size: _getIconSize(),
      color: _getIconColor(),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: iconWidget,
      );
    }

    return iconWidget;
  }

  double _getIconSize() {
    switch (size) {
      case Pragma4IconSize.small:
        return 16;
      case Pragma4IconSize.medium:
        return 24;
      case Pragma4IconSize.large:
        return 32;
      case Pragma4IconSize.xlarge:
        return 48;
    }
  }

  Color? _getIconColor() {
    if (color != null) return color;
    
    if (semanticColor != null) return semanticColor;
    
  return null; // Usar valor por defecto del tema
  }
}

/// Componente de botón de ícono
class Pragma4IconButton extends StatelessWidget {
  const Pragma4IconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = Pragma4IconSize.medium,
    this.backgroundColor,
    this.iconColor,
    this.borderRadius,
    this.tooltip,
    this.isDisabled = false,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Pragma4IconSize size;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? borderRadius;
  final String? tooltip;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final button = Material(
      color: backgroundColor ?? Colors.transparent,
      borderRadius: BorderRadius.circular(
        borderRadius ?? _getDefaultBorderRadius(),
      ),
      child: InkWell(
        onTap: isDisabled ? null : onPressed,
        borderRadius: BorderRadius.circular(
          borderRadius ?? _getDefaultBorderRadius(),
        ),
        child: Padding(
          padding: EdgeInsets.all(_getPadding()),
          child: Pragma4Icon(
            icon,
            size: size,
            color: isDisabled 
                ? Pragma4Colors.grey400 
                : iconColor,
          ),
        ),
      ),
    );

    if (tooltip != null) {
      return Tooltip(
        message: tooltip!,
        child: button,
      );
    }
    return button;
  }

  double _getDefaultBorderRadius() {
    switch (size) {
      case Pragma4IconSize.small:
        return 4.0;
      case Pragma4IconSize.medium:
        return 8.0;
      case Pragma4IconSize.large:
      case Pragma4IconSize.xlarge:
        return 12.0;
    }
  }

  double _getPadding() {
    switch (size) {
      case Pragma4IconSize.small:
        return 4.0;
      case Pragma4IconSize.medium:
        return 8.0;
      case Pragma4IconSize.large:
        return 16.0;
      case Pragma4IconSize.xlarge:
        return 24.0;
    }
  }
}
