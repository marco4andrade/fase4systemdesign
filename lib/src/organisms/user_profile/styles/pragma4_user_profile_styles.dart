import 'package:flutter/material.dart';

/// Helper de estilos para componentes de perfil de usuario
class Pragma4UserProfileStyles {
  Pragma4UserProfileStyles._();

  /// Padding principal del perfil
  static const EdgeInsets mainPadding = EdgeInsets.all(24.0);

  /// Espaciado entre avatar e información
  static const double avatarInfoSpacing = 16.0;

  /// Espaciado entre elementos de información
  static const double infoSpacing = 4.0;

  /// Espaciado antes de la biografía
  static const double bioSpacing = 16.0;

  /// Espaciado antes de las acciones
  static const double actionsSpacing = 24.0;

  /// Configuración de cross axis alignment para información
  static const CrossAxisAlignment infoAlignment = CrossAxisAlignment.start;

  /// Configuración de main axis alignment para botones
  static const MainAxisAlignment actionsAlignment = MainAxisAlignment.center;
}