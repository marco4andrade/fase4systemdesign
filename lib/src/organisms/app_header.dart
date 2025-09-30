import 'package:flutter/material.dart';
import '../atoms/atoms.dart';

/// Encabezado de la aplicación con navegación y acciones
class Pragma4AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const Pragma4AppHeader({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.actions,
    this.onMenuPressed,
    this.showBackButton = false,
    this.centerTitle = true,
    this.height = kToolbarHeight,
  });

  final String? title;
  final String? subtitle;
  final Widget? leading;
  final List<Widget>? actions;
  final VoidCallback? onMenuPressed;
  final bool showBackButton;
  final bool centerTitle;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: subtitle != null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Pragma4Text(
                    title!,
                    variant: Pragma4TextVariant.headlineMedium,
                  ),
                Pragma4Text(
                  subtitle!,
                  variant: Pragma4TextVariant.bodySmall,
                  semanticColor: Pragma4TextColor.tertiary,
                ),
              ],
            )
          : title != null
          ? Pragma4Text(title!, variant: Pragma4TextVariant.headlineMedium)
          : null,
      leading:
          leading ??
          (showBackButton
              ? Pragma4IconButton(
                  icon: Icons.arrow_back,
                  onPressed: () => Navigator.of(context).pop(),
                )
              : onMenuPressed != null
              ? Pragma4IconButton(icon: Icons.menu, onPressed: onMenuPressed)
              : null),
      actions: actions,
      centerTitle: centerTitle,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

