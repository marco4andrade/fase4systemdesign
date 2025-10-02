import 'package:flutter/material.dart';
import '../../../enums/enums.dart';
import '../pragma4_icon.dart';
import '../styles/pragma4_icon_styles.dart';

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
    final effectiveBorderRadius = borderRadius ?? Pragma4IconStyles.getDefaultBorderRadius(size);
    
    final button = Material(
      color: backgroundColor ?? Pragma4IconStyles.getDefaultBackgroundColor(),
      borderRadius: BorderRadius.circular(effectiveBorderRadius),
      child: InkWell(
        onTap: isDisabled ? null : onPressed,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        child: Padding(
          padding: EdgeInsets.all(Pragma4IconStyles.getPadding(size)),
          child: Pragma4Icon(
            icon,
            size: size,
            color: isDisabled 
                ? Pragma4IconStyles.getDisabledIconColor()
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
}