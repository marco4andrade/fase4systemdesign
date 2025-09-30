import 'package:flutter/material.dart';
import '../atoms/atoms.dart';
import '../theme/app_colors.dart';

/// Variantes de mensaje de alerta
/// Variantes visuales del mensaje de alerta
enum Pragma4AlertVariant { info, success, warning, error }

/// Molécula de mensaje de alerta para notificaciones y retroalimentación
class Pragma4AlertMessage extends StatelessWidget {
  const Pragma4AlertMessage({
    super.key,
    required this.message,
    this.title,
    this.variant = Pragma4AlertVariant.info,
    this.onClose,
    this.actions,
    this.showIcon = true,
  });

  final String message;
  final String? title;
  final Pragma4AlertVariant variant;
  final VoidCallback? onClose;
  final List<Widget>? actions;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: _getBorderColor(), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showIcon) ...[
            Pragma4Icon(
              _getIcon(),
              color: _getIconColor(),
              size: Pragma4IconSize.small,
            ),
            const SizedBox(width: 8.0),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null) ...[
                  Pragma4Text(
                    title!,
                    variant: Pragma4TextVariant.labelLarge,
                    color: _getTextColor(),
                  ),
                  const SizedBox(height: 4.0),
                ],
                Pragma4Text(
                  message,
                  variant: Pragma4TextVariant.bodyMedium,
                  color: _getTextColor(),
                ),
                if (actions != null && actions!.isNotEmpty) ...[
                  const SizedBox(height: 8.0),
                  Row(children: actions!),
                ],
              ],
            ),
          ),
          if (onClose != null) ...[
            const SizedBox(width: 8.0),
            Pragma4IconButton(
              icon: Icons.close,
              size: Pragma4IconSize.small,
              onPressed: onClose,
              iconColor: _getIconColor(),
            ),
          ],
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case Pragma4AlertVariant.info:
        return Pragma4Colors.info.withValues(alpha: 0.1);
      case Pragma4AlertVariant.success:
        return Pragma4Colors.success.withValues(alpha: 0.1);
      case Pragma4AlertVariant.warning:
        return Pragma4Colors.warning.withValues(alpha: 0.1);
      case Pragma4AlertVariant.error:
        return Pragma4Colors.error.withValues(alpha: 0.1);
    }
  }

  Color _getBorderColor() {
    switch (variant) {
      case Pragma4AlertVariant.info:
        return Pragma4Colors.info.withValues(alpha: 0.3);
      case Pragma4AlertVariant.success:
        return Pragma4Colors.success.withValues(alpha: 0.3);
      case Pragma4AlertVariant.warning:
        return Pragma4Colors.warning.withValues(alpha: 0.3);
      case Pragma4AlertVariant.error:
        return Pragma4Colors.error.withValues(alpha: 0.3);
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case Pragma4AlertVariant.info:
        return Pragma4Colors.info;
      case Pragma4AlertVariant.success:
        return Pragma4Colors.success;
      case Pragma4AlertVariant.warning:
        return Pragma4Colors.warning;
      case Pragma4AlertVariant.error:
        return Pragma4Colors.error;
    }
  }

  Color _getIconColor() {
    return _getTextColor();
  }

  IconData _getIcon() {
    switch (variant) {
      case Pragma4AlertVariant.info:
        return Icons.info_outline;
      case Pragma4AlertVariant.success:
        return Icons.check_circle_outline;
      case Pragma4AlertVariant.warning:
        return Icons.warning_outlined;
      case Pragma4AlertVariant.error:
        return Icons.error_outline;
    }
  }
}
