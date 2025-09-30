import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

/// Configuración principal del tema para el sistema de diseño
class Pragma4Theme {
  Pragma4Theme._();

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: Pragma4Typography.primaryFontFamily,
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: Pragma4Colors.primary,
        onPrimary: Pragma4Colors.onPrimary,
        secondary: Pragma4Colors.secondary,
        onSecondary: Pragma4Colors.onSecondary,
        surface: Pragma4Colors.surface,
        onSurface: Pragma4Colors.onSurface,
        error: Pragma4Colors.error,
        onError: Pragma4Colors.onError,
      ),
      textTheme: const TextTheme(
        displayLarge: Pragma4Typography.displayLarge,
        displayMedium: Pragma4Typography.displayMedium,
        displaySmall: Pragma4Typography.displaySmall,
        headlineLarge: Pragma4Typography.headlineLarge,
        headlineMedium: Pragma4Typography.headlineMedium,
        headlineSmall: Pragma4Typography.headlineSmall,
        bodyLarge: Pragma4Typography.bodyLarge,
        bodyMedium: Pragma4Typography.bodyMedium,
        bodySmall: Pragma4Typography.bodySmall,
        labelLarge: Pragma4Typography.labelLarge,
        labelMedium: Pragma4Typography.labelMedium,
        labelSmall: Pragma4Typography.labelSmall,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Pragma4Colors.primary,
          foregroundColor: Pragma4Colors.onPrimary,
          textStyle: Pragma4Typography.buttonMedium,
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 2,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Pragma4Colors.primary,
          textStyle: Pragma4Typography.buttonMedium,
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: const BorderSide(color: Pragma4Colors.primary),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Pragma4Colors.primary,
          textStyle: Pragma4Typography.buttonMedium,
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Pragma4Colors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Pragma4Colors.grey300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Pragma4Colors.grey300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Pragma4Colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Pragma4Colors.error),
        ),
        labelStyle: Pragma4Typography.labelMedium.copyWith(
          color: Pragma4Colors.onSurfaceVariant,
        ),
        hintStyle: Pragma4Typography.bodyMedium.copyWith(
          color: Pragma4Colors.onSurfaceVariant,
        ),
      ),
      cardTheme: CardThemeData(
        color: Pragma4Colors.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.all(16.0),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Pragma4Colors.surface,
        foregroundColor: Pragma4Colors.onSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: Pragma4Typography.headlineMedium,
      ),
      scaffoldBackgroundColor: Pragma4Colors.background,
      dividerTheme: const DividerThemeData(
        color: Pragma4Colors.grey200,
        thickness: 1,
        space: 16.0,
      ),
    );
  }

  static ThemeData get darkTheme {
    return lightTheme.copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Pragma4Colors.grey900,
      colorScheme: const ColorScheme.dark(
        primary: Pragma4Colors.primaryLight,      // lighter tone for dark bg
        onPrimary: Pragma4Colors.grey900,
        secondary: Pragma4Colors.secondaryLight,
        onSecondary: Pragma4Colors.grey900,
        surface: Pragma4Colors.grey800,
        onSurface: Pragma4Colors.grey100,
        error: Pragma4Colors.error,
        onError: Colors.white,
      ),
    );
  }
}
