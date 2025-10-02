import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../enums/enums.dart';

/// Helper de estilos para componentes de avatar
class Pragma4AvatarStyles {
  Pragma4AvatarStyles._();

  /// Obtiene el tamaño del avatar según el tamaño especificado
  static double getAvatarSize(Pragma4ComponentSize size) {
    return size.avatarSize;
  }

  /// Obtiene el estilo de texto para las iniciales según el tamaño
  static TextStyle getTextStyle(Pragma4ComponentSize size) {
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

  /// Obtiene el color de fondo por defecto
  static Color getDefaultBackgroundColor() {
    return Pragma4Colors.primary;
  }

  /// Obtiene el color de texto por defecto
  static Color getDefaultTextColor() {
    return Pragma4Colors.onPrimary;
  }

  /// Construye la decoración del avatar
  static BoxDecoration buildAvatarDecoration({
    required Pragma4ComponentSize size,
    Color? backgroundColor,
    Border? border,
    String? imageUrl,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? getDefaultBackgroundColor(),
      shape: BoxShape.circle,
      border: border,
      image: imageUrl != null
          ? DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            )
          : null,
    );
  }

  /// Construye el widget de texto para las iniciales
  static Widget buildInitialsText({
    required String initials,
    required Pragma4ComponentSize size,
    Color? textColor,
  }) {
    return Center(
      child: Text(
        initials.toUpperCase(),
        style: getTextStyle(size).copyWith(
          color: textColor ?? getDefaultTextColor(),
        ),
      ),
    );
  }
}