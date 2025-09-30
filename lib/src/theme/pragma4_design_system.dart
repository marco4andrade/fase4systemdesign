import 'package:flutter/material.dart';
import 'app_theme.dart';

/// Wrapper minimalista para el sistema de diseño.
///
/// Uso: envuelve la aplicación o una subrama del árbol de widgets para que los
/// componentes del sistema de diseño usen el tema interno sin exponer los
/// tokens públicamente.
class Pragma4DesignSystem extends StatelessWidget {
  const Pragma4DesignSystem({
    super.key,
    required this.child,
    this.themeMode = ThemeMode.light,
    this.lightTheme,
    this.darkTheme,
  });

  final Widget child;
  final ThemeMode themeMode;
  final ThemeData? lightTheme;
  final ThemeData? darkTheme;

  @override
  Widget build(BuildContext context) {
    final ThemeData resolvedLight = lightTheme ?? Pragma4Theme.lightTheme;
    final ThemeData resolvedDark = darkTheme ?? Pragma4Theme.darkTheme;

    final ThemeData data = themeMode == ThemeMode.dark
        ? resolvedDark
        : resolvedLight;

    return Theme(data: data, child: child);
  }
}
