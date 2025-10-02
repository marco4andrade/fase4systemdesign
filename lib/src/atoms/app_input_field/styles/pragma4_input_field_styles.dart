import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import '../../../enums/enums.dart';

/// Helper class para manejar todos los estilos del input field
class Pragma4InputFieldStyles {
  const Pragma4InputFieldStyles._();

  /// Obtiene el padding del contenido según el tamaño
  static EdgeInsets getContentPadding(Pragma4ComponentSize size) {
    return EdgeInsets.symmetric(
      horizontal: size.buttonPadding,
      vertical: size.buttonPadding / 2,
    );
  }

  /// Obtiene el borde por defecto según la variante
  static InputBorder getBorder(
    Pragma4ComponentVariant variant,
    Pragma4ComponentSize size,
  ) {
    final borderRadius = getBorderRadius(size);

    switch (variant) {
      case Pragma4ComponentVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Pragma4Colors.grey300),
        );
      case Pragma4ComponentVariant.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        );
      case Pragma4ComponentVariant.underlined:
        return const UnderlineInputBorder(
          borderSide: BorderSide(color: Pragma4Colors.grey300),
        );
      default:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Pragma4Colors.grey300),
        );
    }
  }

  /// Obtiene el borde cuando está enfocado
  static InputBorder getFocusedBorder(
    Pragma4ComponentVariant variant,
    Pragma4ComponentSize size,
  ) {
    final borderRadius = getBorderRadius(size);

    switch (variant) {
      case Pragma4ComponentVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Pragma4Colors.primary, width: 2),
        );
      case Pragma4ComponentVariant.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Pragma4Colors.primary, width: 2),
        );
      case Pragma4ComponentVariant.underlined:
        return const UnderlineInputBorder(
          borderSide: BorderSide(color: Pragma4Colors.primary, width: 2),
        );
      default:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Pragma4Colors.primary, width: 2),
        );
    }
  }

  /// Obtiene el borde cuando hay error
  static InputBorder getErrorBorder(
    Pragma4ComponentVariant variant,
    Pragma4ComponentSize size,
  ) {
    final borderRadius = getBorderRadius(size);

    switch (variant) {
      case Pragma4ComponentVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Pragma4Colors.error),
        );
      case Pragma4ComponentVariant.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Pragma4Colors.error),
        );
      case Pragma4ComponentVariant.underlined:
        return const UnderlineInputBorder(
          borderSide: BorderSide(color: Pragma4Colors.error),
        );
      default:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Pragma4Colors.error),
        );
    }
  }

  /// Obtiene el borde cuando está deshabilitado
  static InputBorder getDisabledBorder(
    Pragma4ComponentVariant variant,
    Pragma4ComponentSize size,
  ) {
    final borderRadius = getBorderRadius(size);

    switch (variant) {
      case Pragma4ComponentVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Pragma4Colors.grey200),
        );
      case Pragma4ComponentVariant.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        );
      case Pragma4ComponentVariant.underlined:
        return const UnderlineInputBorder(
          borderSide: BorderSide(color: Pragma4Colors.grey200),
        );
      default:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Pragma4Colors.grey200),
        );
    }
  }

  /// Obtiene el radio del borde según el tamaño
  static double getBorderRadius(Pragma4ComponentSize size) {
    switch (size) {
      case Pragma4ComponentSize.small:
        return 4.0;
      case Pragma4ComponentSize.medium:
        return 8.0;
      case Pragma4ComponentSize.large:
        return 12.0;
      case Pragma4ComponentSize.xlarge:
        return 16.0;
    }
  }

  /// Obtiene el estilo del texto según el tamaño
  static TextStyle getTextStyle(Pragma4ComponentSize size) {
    switch (size) {
      case Pragma4ComponentSize.small:
        return Pragma4Typography.bodySmall;
      case Pragma4ComponentSize.medium:
        return Pragma4Typography.bodyMedium;
      case Pragma4ComponentSize.large:
        return Pragma4Typography.bodyLarge;
      case Pragma4ComponentSize.xlarge:
        return Pragma4Typography.bodyLarge;
    }
  }

  /// Obtiene el estilo del label
  static TextStyle getLabelStyle() {
    return Pragma4Typography.labelMedium.copyWith(
      color: Pragma4Colors.onSurface,
      fontWeight: FontWeight.w500,
    );
  }

  /// Obtiene el estilo del hint
  static TextStyle getHintStyle(Pragma4ComponentSize size) {
    return getTextStyle(size).copyWith(color: Pragma4Colors.onSurfaceVariant);
  }

  /// Obtiene el estilo del helper/error text
  static TextStyle getHelperStyle({bool isError = false}) {
    return Pragma4Typography.bodySmall.copyWith(
      color: isError ? Pragma4Colors.error : Pragma4Colors.onSurfaceVariant,
    );
  }

  /// Obtiene el tamaño del icono
  static double getIconSize(Pragma4ComponentSize size) {
    return size.iconSize;
  }

  /// Obtiene el color de relleno para variante filled
  static Color? getFillColor(Pragma4ComponentVariant variant) {
    return variant == Pragma4ComponentVariant.filled
        ? Pragma4Colors.surfaceVariant
        : null;
  }

  /// Determina si debe usar relleno
  static bool shouldFill(Pragma4ComponentVariant variant) {
    return variant == Pragma4ComponentVariant.filled;
  }
}