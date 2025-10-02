import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../theme/app_colors.dart';
import '../../../enums/enums.dart';
import '../styles/pragma4_list_item_styles.dart';

/// Molécula de elemento de lista con estructura consistente
class Pragma4ListItem extends StatelessWidget {
  const Pragma4ListItem({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.isThreeLine = false,
    this.enabled = true,
    this.selected = false,
    this.dense = false,
    this.backgroundColor = Colors.white,
    this.borderRadius = 8.0,
    this.borderColor = const Color(0xFFE0E0E0),
    this.borderWidth = 1.0,
    this.elevation = 2.0,
    this.showDecoration = true,
  });

  final Widget? leading;
  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isThreeLine;
  final bool enabled;
  final bool selected;
  final bool dense;

  final Color? backgroundColor;
  final double borderRadius;
  final Color? borderColor;
  final double borderWidth;
  final double elevation;

  final bool showDecoration;

  @override
  Widget build(BuildContext context) {
    final Color effectiveBackground = Pragma4ListItemStyles.getEffectiveBackgroundColor(
      selected: selected,
      backgroundColor: backgroundColor,
    );

    return Container(
      decoration: Pragma4ListItemStyles.buildListItemDecoration(
        effectiveBackground: effectiveBackground,
        borderRadius: borderRadius,
        showDecoration: showDecoration,
        borderColor: borderColor,
        borderWidth: borderWidth,
        elevation: elevation,
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          leading: leading,
          title: title != null
              ? Pragma4Text(
                  title!,
                  variant: Pragma4TextType.bodyLarge,
                  color: enabled ? null : Pragma4Colors.onSurfaceVariant,
                )
              : null,
          subtitle: subtitle != null
              ? Pragma4Text(
                  subtitle!,
                  variant: Pragma4TextType.bodyMedium,
                  semanticColor: Pragma4ComponentColor.muted,
                )
              : null,
          trailing: trailing,
          onTap: enabled ? onTap : null,
          isThreeLine: isThreeLine,
          enabled: enabled,
          selected: selected,
          dense: dense,
          contentPadding: Pragma4ListItemStyles.getContentPadding(),
        ),
      ),
    );
  }
}