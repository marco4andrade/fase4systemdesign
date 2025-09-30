import 'package:flutter/material.dart';
import '../atoms/atoms.dart';
import '../theme/app_colors.dart';
import '../theme/app_shadows.dart';

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
    final Color effectiveBackground = selected
        ? Pragma4Colors.primaryLight.withValues(alpha: 0.1)
        : (backgroundColor ?? Colors.transparent);

    return Container(
      decoration: BoxDecoration(
        color: effectiveBackground,
        borderRadius: BorderRadius.circular(borderRadius),
        border: showDecoration && borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth)
            : null,
        boxShadow: showDecoration && elevation > 0 ? _getShadow() : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          leading: leading,
          title: title != null
              ? Pragma4Text(
                  title!,
                  variant: Pragma4TextVariant.bodyLarge,
                  color: enabled ? null : Pragma4Colors.onSurfaceVariant,
                )
              : null,
          subtitle: subtitle != null
              ? Pragma4Text(
                  subtitle!,
                  variant: Pragma4TextVariant.bodyMedium,
                  semanticColor: Pragma4TextColor.tertiary,
                )
              : null,
          trailing: trailing,
          onTap: enabled ? onTap : null,
          isThreeLine: isThreeLine,
          enabled: enabled,
          selected: selected,
          dense: dense,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 4.0,
          ),
        ),
      ),
    );
  }

  List<BoxShadow> _getShadow() {
    if (elevation <= 1) return Pragma4Shadows.sm;
    if (elevation <= 3) return Pragma4Shadows.md;
    if (elevation <= 6) return Pragma4Shadows.lg;
    return Pragma4Shadows.xl;
  }
}

/// Elemento de lista con avatar
class Pragma4AvatarListItem extends Pragma4ListItem {
  const Pragma4AvatarListItem({
    super.key,
    required this.avatarUrl,
    required this.name,
    this.description,
    super.trailing,
    super.onTap,
    super.enabled,
    super.selected,
    this.avatarSize = Pragma4AvatarSize.medium,
  }) : super(title: name, subtitle: description);

  final String avatarUrl;
  final String name;
  final String? description;
  final Pragma4AvatarSize avatarSize;

  @override
  Widget build(BuildContext context) {
    return Pragma4ListItem(
      leading: Pragma4Avatar(
        imageUrl: avatarUrl,
        initials: name.isNotEmpty ? name[0] : '?',
        size: avatarSize,
      ),
      title: name,
      subtitle: description,
      trailing: trailing,
      onTap: onTap,
      enabled: enabled,
      selected: selected,
    );
  }
}

/// Elemento de lista con ícono
class Pragma4IconListItem extends Pragma4ListItem {
  const Pragma4IconListItem({
    super.key,
    required this.icon,
    required super.title,
    super.subtitle,
    super.trailing,
    super.onTap,
    super.enabled,
    super.selected,
    this.iconColor,
    this.iconSize = Pragma4IconSize.medium,
  });

  final IconData icon;
  final Color? iconColor;
  final Pragma4IconSize iconSize;

  @override
  Widget build(BuildContext context) {
    return Pragma4ListItem(
      leading: Pragma4Icon(icon, size: iconSize, color: iconColor),
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: onTap,
      enabled: enabled,
      selected: selected,
    );
  }
}
