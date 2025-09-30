import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Tamaños de avatar
enum Pragma4AvatarSize {
  small, // 32 px
  medium, // 48 px
  large, // 64 px
  xlarge, // 96 px
}

/// Componente de avatar atómico para representar usuarios
class Pragma4Avatar extends StatelessWidget {
  const Pragma4Avatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.backgroundColor,
    this.textColor,
    this.size = Pragma4AvatarSize.medium,
    this.onTap,
    this.border,
  }) : assert(
         imageUrl != null || initials != null,
         'Se debe proporcionar la URL de la imagen',
       );

  final String? imageUrl;
  final String? initials;
  final Color? backgroundColor;
  final Color? textColor;
  final Pragma4AvatarSize size;
  final VoidCallback? onTap;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    final avatarWidget = Container(
      width: _getSize(),
      height: _getSize(),
      decoration: BoxDecoration(
        color: backgroundColor ?? _getDefaultBackgroundColor(),
        shape: BoxShape.circle,
        border: border,
        image: imageUrl != null
            ? DecorationImage(image: NetworkImage(imageUrl!), fit: BoxFit.cover)
            : null,
      ),
      child: imageUrl == null && initials != null
          ? Center(
              child: Text(
                initials!.toUpperCase(),
                style: _getTextStyle().copyWith(
                  color: textColor ?? _getDefaultTextColor(),
                ),
              ),
            )
          : null,
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: avatarWidget);
    }

    return avatarWidget;
  }

  double _getSize() {
    switch (size) {
      case Pragma4AvatarSize.small:
        return 32;
      case Pragma4AvatarSize.medium:
        return 48;
      case Pragma4AvatarSize.large:
        return 64;
      case Pragma4AvatarSize.xlarge:
        return 96;
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case Pragma4AvatarSize.small:
        return Pragma4Typography.labelSmall;
      case Pragma4AvatarSize.medium:
        return Pragma4Typography.labelMedium;
      case Pragma4AvatarSize.large:
        return Pragma4Typography.labelLarge;
      case Pragma4AvatarSize.xlarge:
        return Pragma4Typography.headlineSmall;
    }
  }

  Color _getDefaultBackgroundColor() {
    return Pragma4Colors.primary;
  }

  Color _getDefaultTextColor() {
    return Pragma4Colors.onPrimary;
  }
}

/// Componente de grupo de avatares para mostrar múltiples usuarios
class Pragma4AvatarGroup extends StatelessWidget {
  const Pragma4AvatarGroup({
    super.key,
    required this.avatars,
    this.size = Pragma4AvatarSize.medium,
    this.maxAvatars = 3,
    this.spacing = 4,
  });

  final List<Pragma4Avatar> avatars;
  final Pragma4AvatarSize size;
  final int maxAvatars;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final displayAvatars = avatars.take(maxAvatars).toList();
    final remainingCount = avatars.length - maxAvatars;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...displayAvatars.asMap().entries.map((entry) {
          final index = entry.key;
          final avatar = entry.value;

          return Padding(
            padding: EdgeInsets.only(
              right: index < displayAvatars.length - 1 ? spacing : 0,
            ),
            child: avatar,
          );
        }),
        if (remainingCount > 0) ...[
          SizedBox(width: spacing),
          Pragma4Avatar(
            initials: '+$remainingCount',
            size: size,
            backgroundColor: Pragma4Colors.grey300,
            textColor: Pragma4Colors.grey700,
          ),
        ],
      ],
    );
  }
}
