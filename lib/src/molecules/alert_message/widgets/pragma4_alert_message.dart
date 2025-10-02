import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../enums/enums.dart';
import '../styles/pragma4_alert_styles.dart';

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
      decoration: Pragma4AlertStyles.buildAlertDecoration(variant),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showIcon) ...[
            Pragma4Icon(
              Pragma4AlertStyles.getIcon(variant),
              color: Pragma4AlertStyles.getIconColor(variant),
              size: Pragma4ComponentSize.small,
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
                    variant: Pragma4TextType.labelLarge,
                    color: Pragma4AlertStyles.getTextColor(variant),
                  ),
                  const SizedBox(height: 4.0),
                ],
                Pragma4Text(
                  message,
                  variant: Pragma4TextType.bodyMedium,
                  color: Pragma4AlertStyles.getTextColor(variant),
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
              size: Pragma4ComponentSize.small,
              onPressed: onClose,
              iconColor: Pragma4AlertStyles.getIconColor(variant),
            ),
          ],
        ],
      ),
    );
  }
}