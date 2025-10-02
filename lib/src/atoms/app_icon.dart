import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../enums/enums.dart';

/// Componente de ícono atómico con tamaño y estilo consistentes
class Pragma4Icon extends StatelessWidget {
  const Pragma4Icon(
    this.icon, {
    super.key,
    this.size = Pragma4ComponentSize.medium,
    this.color,
    this.semanticColor,
    this.onTap,
  });

  final IconData icon;
  final Pragma4ComponentSize size;
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
    return size.iconSize;
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
    this.size = Pragma4ComponentSize.medium,
    this.backgroundColor,
    this.iconColor,
    this.borderRadius,
    this.tooltip,
    this.isDisabled = false,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Pragma4ComponentSize size;
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
      case Pragma4ComponentSize.small:
        return 4.0;
      case Pragma4ComponentSize.medium:
        return 6.0;
      case Pragma4ComponentSize.large:
        return 8.0;
      case Pragma4ComponentSize.xlarge:
        return 10.0;
    }
  }

  double _getPadding() {
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
}
