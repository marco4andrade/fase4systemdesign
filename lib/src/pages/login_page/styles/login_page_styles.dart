import 'package:flutter/material.dart';

/// Helper de estilos para la página de login
class LoginPageStyles {
  LoginPageStyles._();

  // Espaciados
  static const double mainPadding = 24.0;
  static const double maxFormWidth = 400.0;
  static const double logoSpacing = 32.0;
  static const double titleSpacing = 8.0;
  static const double sectionSpacing = 32.0;
  static const double fieldSpacing = 16.0;
  static const double actionSpacing = 24.0;
  static const double rememberMeSpacing = 8.0;

  // Configuraciones de layout
  static const MainAxisAlignment centerAlignment = MainAxisAlignment.center;
  static const CrossAxisAlignment stretchAlignment = CrossAxisAlignment.stretch;
  static const TextAlign centerTextAlign = TextAlign.center;
  static const MainAxisAlignment spaceBetweenAlignment = MainAxisAlignment.spaceBetween;

  // Constrains
  static const BoxConstraints formConstraints = BoxConstraints(maxWidth: maxFormWidth);

  // Configuraciones de campos
  static const TextInputType emailKeyboardType = TextInputType.emailAddress;

  // Configuraciones de botones
  static const MainAxisSize minButtonSize = MainAxisSize.min;
}