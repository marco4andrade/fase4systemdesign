import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../enums/enums.dart';

/// Componente de botón atómico con estilo y comportamiento consistentes
class Pragma4Button extends StatelessWidget {
  const Pragma4Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = Pragma4ComponentVariant.primary,
    this.size = Pragma4ComponentSize.medium,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.iconPosition = Pragma4ComponentPosition.leading,
    this.fullWidth = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final Pragma4ComponentVariant variant;
  final Pragma4ComponentSize size;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final Pragma4ComponentPosition iconPosition;
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
      children: iconPosition == Pragma4ComponentPosition.leading
          ? [iconWidget, SizedBox(width: _getIconSpacing()), textWidget]
          : [textWidget, SizedBox(width: _getIconSpacing()), iconWidget],
    );
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case Pragma4ComponentVariant.primary:
        return Pragma4Colors.primary;
      case Pragma4ComponentVariant.secondary:
        return Pragma4Colors.secondaryLight.withValues(alpha: 0.20);
      case Pragma4ComponentVariant.outline:
      case Pragma4ComponentVariant.ghost:
        return Colors.transparent;
      case Pragma4ComponentVariant.danger:
        return Pragma4Colors.error;
      default:
        return Pragma4Colors.primary;
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case Pragma4ComponentVariant.primary:
        return Pragma4Colors.onPrimary;
      case Pragma4ComponentVariant.secondary:
        return Pragma4Colors.secondaryDark;
      case Pragma4ComponentVariant.outline:
        return Pragma4Colors.primary;
      case Pragma4ComponentVariant.ghost:
        return Pragma4Colors.primary;
      case Pragma4ComponentVariant.danger:
        return Pragma4Colors.onError;
      default:
        return Pragma4Colors.onPrimary;
    }
  }

  Color _getDisabledColor() {
    switch (variant) {
      case Pragma4ComponentVariant.primary:
        return Pragma4Colors.primary.withValues(alpha: 0.45);
      case Pragma4ComponentVariant.secondary:
        return Pragma4Colors.secondary.withValues(alpha: 0.45);
      case Pragma4ComponentVariant.danger:
        return Pragma4Colors.error.withValues(alpha: 0.45);
      case Pragma4ComponentVariant.outline:
      case Pragma4ComponentVariant.ghost:
        return Colors.transparent;
      default:
        return Pragma4Colors.primary.withValues(alpha: 0.45);
    }
  }

  Color _getDisabledTextColor() {
    switch (variant) {
      case Pragma4ComponentVariant.primary:
        return Pragma4Colors.onPrimary.withValues(alpha: 0.6);
      case Pragma4ComponentVariant.secondary:
        return Pragma4Colors.onSecondary.withValues(alpha: 0.6);
      case Pragma4ComponentVariant.danger:
        return Pragma4Colors.onError.withValues(alpha: 0.6);
      case Pragma4ComponentVariant.outline:
      case Pragma4ComponentVariant.ghost:
        return Pragma4Colors.primary.withValues(alpha: 0.4);
      default:
        return Pragma4Colors.onPrimary.withValues(alpha: 0.6);
    }
  }

  BorderSide _getBorderSide() {
    switch (variant) {
      case Pragma4ComponentVariant.outline:
        return BorderSide(color: Pragma4Colors.primary, width: 1);
      case Pragma4ComponentVariant.danger:
        if (variant == Pragma4ComponentVariant.outline) {
          return BorderSide(color: Pragma4Colors.error, width: 1);
        }
        return BorderSide.none;
      case Pragma4ComponentVariant.secondary:
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
      case Pragma4ComponentVariant.primary:
      case Pragma4ComponentVariant.danger:
        return 2.0;
      case Pragma4ComponentVariant.secondary:
        return 0.0;
      case Pragma4ComponentVariant.outline:
      case Pragma4ComponentVariant.ghost:
        return 0.0;
      default:
        return 0.0;
    }
  }

  double _getHighlightElevation() {
    return _getElevation() + 2;
  }

  double _getBorderRadius() {
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

  EdgeInsets _getPadding() {
    switch (size) {
      case Pragma4ComponentSize.small:
        return const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
      case Pragma4ComponentSize.medium:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
      case Pragma4ComponentSize.large:
        return const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0);
      case Pragma4ComponentSize.xlarge:
        return const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0);
    }
  }

  double _getMinWidth() {
    switch (size) {
      case Pragma4ComponentSize.small:
        return 64;
      case Pragma4ComponentSize.medium:
        return 88;
      case Pragma4ComponentSize.large:
        return 120;
      case Pragma4ComponentSize.xlarge:
        return 150;
    }
  }

  double _getHeight() {
    switch (size) {
      case Pragma4ComponentSize.small:
        return 32;
      case Pragma4ComponentSize.medium:
        return 40;
      case Pragma4ComponentSize.large:
        return 48;
      case Pragma4ComponentSize.xlarge:
        return 56;
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case Pragma4ComponentSize.small:
        return Pragma4Typography.buttonSmall;
      case Pragma4ComponentSize.medium:
        return Pragma4Typography.buttonMedium;
      case Pragma4ComponentSize.large:
        return Pragma4Typography.buttonLarge;
      case Pragma4ComponentSize.xlarge:
        return Pragma4Typography.buttonLarge; // Usar mismo estilo que large
    }
  }

  double _getIconSize() {
    return size.iconSize;
  }

  double _getIconSpacing() {
    return 4.0;
  }

  double _getLoadingSize() {
    switch (size) {
      case Pragma4ComponentSize.small:
        return 14;
      case Pragma4ComponentSize.medium:
        return 16;
      case Pragma4ComponentSize.large:
        return 18;
      case Pragma4ComponentSize.xlarge:
        return 20;
    }
  }
}
