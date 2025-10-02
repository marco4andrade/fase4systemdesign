import 'package:flutter/material.dart';
import '../../enums/enums.dart';
import 'styles/pragma4_icon_styles.dart';

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
      size: Pragma4IconStyles.getIconSize(size),
      color: Pragma4IconStyles.getIconColor(
        color: color,
        semanticColor: semanticColor,
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: iconWidget,
      );
    }

    return iconWidget;
  }
}