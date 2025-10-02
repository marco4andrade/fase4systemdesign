import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../enums/enums.dart';

/// Componente de avatar atómico para representar usuarios
class Pragma4Avatar extends StatelessWidget {
  const Pragma4Avatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.backgroundColor,
    this.textColor,
    this.size = Pragma4ComponentSize.medium,
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
  final Pragma4ComponentSize size;
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
    return size.avatarSize;
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case Pragma4ComponentSize.small:
        return Pragma4Typography.labelSmall;
      case Pragma4ComponentSize.medium:
        return Pragma4Typography.labelMedium;
      case Pragma4ComponentSize.large:
        return Pragma4Typography.labelLarge;
      case Pragma4ComponentSize.xlarge:
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
    this.size = Pragma4ComponentSize.medium,
    this.maxAvatars = 3,
    this.spacing = 4,
  });

  final List<Pragma4Avatar> avatars;
  final Pragma4ComponentSize size;
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
