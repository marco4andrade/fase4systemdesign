import 'package:flutter/material.dart';
import '../../../enums/enums.dart';
import '../styles/pragma4_avatar_styles.dart';

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
         'Se debe proporcionar la URL de la imagen o las iniciales',
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
      width: Pragma4AvatarStyles.getAvatarSize(size),
      height: Pragma4AvatarStyles.getAvatarSize(size),
      decoration: Pragma4AvatarStyles.buildAvatarDecoration(
        size: size,
        backgroundColor: backgroundColor,
        border: border,
        imageUrl: imageUrl,
      ),
      child: imageUrl == null && initials != null
          ? Pragma4AvatarStyles.buildInitialsText(
              initials: initials!,
              size: size,
              textColor: textColor,
            )
          : null,
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: avatarWidget);
    }

    return avatarWidget;
  }
}