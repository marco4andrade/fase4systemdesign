import 'package:flutter/material.dart';
import '../../enums/enums.dart';
import 'styles/pragma4_button_styles.dart';

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
        color: Pragma4ButtonStyles.getBackgroundColor(variant),
        textColor: Pragma4ButtonStyles.getTextColor(variant),
        disabledColor: Pragma4ButtonStyles.getDisabledColor(variant),
        disabledTextColor: Pragma4ButtonStyles.getDisabledTextColor(variant),
        elevation: Pragma4ButtonStyles.getElevation(variant),
        highlightElevation: Pragma4ButtonStyles.getHighlightElevation(variant),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Pragma4ButtonStyles.getBorderRadius(size)),
          side: Pragma4ButtonStyles.getBorderSide(variant),
        ),
        padding: Pragma4ButtonStyles.getPadding(size),
        minWidth: Pragma4ButtonStyles.getMinWidth(size),
        height: Pragma4ButtonStyles.getHeight(size),
        child: isLoading
            ? SizedBox(
                width: Pragma4ButtonStyles.getLoadingSize(size),
                height: Pragma4ButtonStyles.getLoadingSize(size),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Pragma4ButtonStyles.getTextColor(variant),
                  ),
                ),
              )
            : _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (icon == null) {
      return Text(
        text,
        style: Pragma4ButtonStyles.getTextStyle(size),
        textAlign: TextAlign.center,
      );
    }

    final iconWidget = Icon(
      icon,
      size: size.iconSize,
      color: Pragma4ButtonStyles.getTextColor(variant),
    );

    final textWidget = Text(text, style: Pragma4ButtonStyles.getTextStyle(size));

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: iconPosition == Pragma4ComponentPosition.leading
          ? [
              iconWidget,
              SizedBox(width: Pragma4ButtonStyles.getIconSpacing()),
              textWidget
            ]
          : [
              textWidget,
              SizedBox(width: Pragma4ButtonStyles.getIconSpacing()),
              iconWidget
            ],
    );
  }
}