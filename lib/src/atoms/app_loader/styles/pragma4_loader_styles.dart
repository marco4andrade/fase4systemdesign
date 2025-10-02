import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../enums/enums.dart';

/// Helper class para manejar todos los estilos de los loaders
class Pragma4LoaderStyles {
  const Pragma4LoaderStyles._();

  /// Obtiene el tamaño del loader según el tamaño del componente
  static double getLoaderSize(Pragma4ComponentSize size) {
    switch (size) {
      case Pragma4ComponentSize.small:
        return 16;
      case Pragma4ComponentSize.medium:
        return 24;
      case Pragma4ComponentSize.large:
        return 32;
      case Pragma4ComponentSize.xlarge:
        return 48;
    }
  }

  /// Obtiene el grosor del stroke según el tamaño
  static double getStrokeWidth(Pragma4ComponentSize size) {
    switch (size) {
      case Pragma4ComponentSize.small:
        return 2;
      case Pragma4ComponentSize.medium:
        return 2.5;
      case Pragma4ComponentSize.large:
        return 3;
      case Pragma4ComponentSize.xlarge:
        return 4;
    }
  }

  /// Obtiene el color por defecto del loader
  static Color getDefaultColor() {
    return Pragma4Colors.primary;
  }

  /// Obtiene el color de fondo por defecto para loaders lineales
  static Color getDefaultBackgroundColor() {
    return Pragma4Colors.grey200;
  }

  /// Obtiene la altura por defecto para loaders lineales
  static double getDefaultLinearHeight() {
    return 4.0;
  }

  /// Obtiene el radio por defecto para loaders lineales
  static double getDefaultLinearBorderRadius() {
    return 2.0;
  }

  /// Obtiene el radio por defecto para skeleton loaders
  static double getDefaultSkeletonBorderRadius() {
    return 4.0;
  }

  /// Obtiene el color base para skeleton loaders
  static Color getSkeletonBaseColor() {
    return Pragma4Colors.grey200;
  }

  /// Obtiene el color de highlight para skeleton loaders
  static Color getSkeletonHighlightColor() {
    return Pragma4Colors.grey100;
  }

  /// Obtiene la duración de la animación del skeleton
  static Duration getSkeletonAnimationDuration() {
    return const Duration(milliseconds: 1500);
  }

  /// Obtiene los stops del gradiente para skeleton loaders
  static List<double> getSkeletonGradientStops(double animationValue) {
    return [
      animationValue - 0.3,
      animationValue,
      animationValue + 0.3,
    ];
  }

  /// Obtiene los colores del gradiente para skeleton loaders
  static List<Color> getSkeletonGradientColors() {
    return const [
      Colors.transparent,
      Pragma4Colors.grey100,
      Colors.transparent,
    ];
  }
}