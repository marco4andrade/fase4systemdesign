import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Variantes de botón siguiendo los principios de diseño atómico
enum Pragma4ButtonVariant { primary, secondary, outline, ghost, danger }

/// Tamaños de botón
enum Pragma4ButtonSize { small, medium, large }

/// Componente de botón atómico con estilo y comportamiento consistentes
class Pragma4Button extends StatelessWidget {
  const Pragma4Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = Pragma4ButtonVariant.primary,
    this.size = Pragma4ButtonSize.medium,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.iconPosition = IconPosition.leading,
    this.fullWidth = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final Pragma4ButtonVariant variant;
  final Pragma4ButtonSize size;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final IconPosition iconPosition;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final isInteractive = !isDisabled && !isLoading && onPressed != null;

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: MaterialButton(
        onPressed: isInteractive ? onPressed : null,
        color: _getBackgroundColor(),
        textColor: _getTextColor(),
        disabledColor: _getDisabledColor(),
        disabledTextColor: _getDisabledTextColor(),
        elevation: _getElevation(),
        highlightElevation: _getHighlightElevation(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          side: _getBorderSide(),
        ),
        padding: _getPadding(),
        minWidth: _getMinWidth(),
        height: _getHeight(),
        child: isLoading
            ? SizedBox(
                width: _getLoadingSize(),
                height: _getLoadingSize(),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(_getTextColor()),
                ),
              )
            : _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (icon == null) {
      return Text(text, style: _getTextStyle(), textAlign: TextAlign.center);
    }

    final iconWidget = Icon(icon, size: _getIconSize(), color: _getTextColor());

    final textWidget = Text(text, style: _getTextStyle());

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: iconPosition == IconPosition.leading
          ? [iconWidget, SizedBox(width: _getIconSpacing()), textWidget]
          : [textWidget, SizedBox(width: _getIconSpacing()), iconWidget],
    );
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case Pragma4ButtonVariant.primary:
        return Pragma4Colors.primary;
      case Pragma4ButtonVariant.secondary:
        return Pragma4Colors.secondaryLight.withValues(alpha: 0.20);
      case Pragma4ButtonVariant.outline:
      case Pragma4ButtonVariant.ghost:
        return Colors.transparent;
      case Pragma4ButtonVariant.danger:
        return Pragma4Colors.error;
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case Pragma4ButtonVariant.primary:
        return Pragma4Colors.onPrimary;
      case Pragma4ButtonVariant.secondary:
        return Pragma4Colors.secondaryDark;
      case Pragma4ButtonVariant.outline:
        return Pragma4Colors.primary;
      case Pragma4ButtonVariant.ghost:
        return Pragma4Colors.primary;
      case Pragma4ButtonVariant.danger:
        return Pragma4Colors.onError;
    }
  }

  Color _getDisabledColor() {
    switch (variant) {
      case Pragma4ButtonVariant.primary:
        return Pragma4Colors.primary.withValues(alpha: 0.45);
      case Pragma4ButtonVariant.secondary:
        return Pragma4Colors.secondary.withValues(alpha: 0.45);
      case Pragma4ButtonVariant.danger:
        return Pragma4Colors.error.withValues(alpha: 0.45);
      case Pragma4ButtonVariant.outline:
      case Pragma4ButtonVariant.ghost:
        return Colors.transparent;
    }
  }

  Color _getDisabledTextColor() {
    switch (variant) {
      case Pragma4ButtonVariant.primary:
        return Pragma4Colors.onPrimary.withValues(alpha: 0.6);
      case Pragma4ButtonVariant.secondary:
        return Pragma4Colors.onSecondary.withValues(alpha: 0.6);
      case Pragma4ButtonVariant.danger:
        return Pragma4Colors.onError.withValues(alpha: 0.6);
      case Pragma4ButtonVariant.outline:
      case Pragma4ButtonVariant.ghost:
        return Pragma4Colors.primary.withValues(alpha: 0.4);
    }
  }

  BorderSide _getBorderSide() {
    switch (variant) {
      case Pragma4ButtonVariant.outline:
        return BorderSide(color: Pragma4Colors.primary, width: 1);
      case Pragma4ButtonVariant.danger:
        if (variant == Pragma4ButtonVariant.outline) {
          return BorderSide(color: Pragma4Colors.error, width: 1);
        }
        return BorderSide.none;
      case Pragma4ButtonVariant.secondary:
        return BorderSide(
          color: Pragma4Colors.secondary.withValues(alpha: 0.6),
          width: 1,
        );
      default:
        return BorderSide.none;
    }
  }

  double _getElevation() {
    switch (variant) {
      case Pragma4ButtonVariant.primary:
      case Pragma4ButtonVariant.danger:
        return 2.0;
      case Pragma4ButtonVariant.secondary:
        return 0.0;
      case Pragma4ButtonVariant.outline:
      case Pragma4ButtonVariant.ghost:
        return 0.0;
    }
  }

  double _getHighlightElevation() {
    return _getElevation() + 2;
  }

  double _getBorderRadius() {
    switch (size) {
      case Pragma4ButtonSize.small:
        return 4.0;
      case Pragma4ButtonSize.medium:
        return 8.0;
      case Pragma4ButtonSize.large:
        return 12.0;
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case Pragma4ButtonSize.small:
        return const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        );
      case Pragma4ButtonSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        );
      case Pragma4ButtonSize.large:
        return const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        );
    }
  }

  double _getMinWidth() {
    switch (size) {
      case Pragma4ButtonSize.small:
        return 64;
      case Pragma4ButtonSize.medium:
        return 88;
      case Pragma4ButtonSize.large:
        return 120;
    }
  }

  double _getHeight() {
    switch (size) {
      case Pragma4ButtonSize.small:
        return 32;
      case Pragma4ButtonSize.medium:
        return 40;
      case Pragma4ButtonSize.large:
        return 48;
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case Pragma4ButtonSize.small:
        return Pragma4Typography.buttonSmall;
      case Pragma4ButtonSize.medium:
        return Pragma4Typography.buttonMedium;
      case Pragma4ButtonSize.large:
        return Pragma4Typography.buttonLarge;
    }
  }

  double _getIconSize() {
    switch (size) {
      case Pragma4ButtonSize.small:
        return 16;
      case Pragma4ButtonSize.medium:
        return 18;
      case Pragma4ButtonSize.large:
        return 20;
    }
  }

  double _getIconSpacing() {
    return 4.0;
  }

  double _getLoadingSize() {
    switch (size) {
      case Pragma4ButtonSize.small:
        return 14;
      case Pragma4ButtonSize.medium:
        return 16;
      case Pragma4ButtonSize.large:
        return 18;
    }
  }
}

/// Posición del ícono dentro del botón
enum IconPosition { leading, trailing }
