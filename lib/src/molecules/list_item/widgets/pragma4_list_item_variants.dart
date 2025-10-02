import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../enums/enums.dart';
import 'pragma4_list_item.dart';

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
    this.avatarSize = Pragma4ComponentSize.medium,
  }) : super(title: name, subtitle: description);

  final String avatarUrl;
  final String name;
  final String? description;
  final Pragma4ComponentSize avatarSize;

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
    this.iconSize = Pragma4ComponentSize.medium,
  });

  final IconData icon;
  final Color? iconColor;
  final Pragma4ComponentSize iconSize;

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