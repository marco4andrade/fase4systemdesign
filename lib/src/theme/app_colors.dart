import 'package:flutter/material.dart';

/// Paleta de colores de la aplicación
class Pragma4Colors {
  Pragma4Colors._();

  // Colores primarios (paleta verde)
  // Elegidos por buen contraste, escala armónica y accesibilidad
  // primaryDark < primary < primaryLight
  static const Color primaryDark = Color(0xFF1B5E20); // Verde oscuro
  static const Color primary = Color(0xFF2E7D32);      // Verde principal
  static const Color primaryLight = Color(0xFF60AD5E); // Verde claro
  static const Color onPrimary = Colors.white;

  // Colores secundarios (teal como acento complementario)
  static const Color secondaryDark = Color(0xFF00695C); // Teal oscuro
  static const Color secondary = Color(0xFF009688);     // Teal
  static const Color secondaryLight = Color(0xFF52C7B8); // Teal claro
  static const Color onSecondary = Colors.white;

  // Colores de fondo
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFF5F5F5);
  
  // Colores de texto
  static const Color onBackground = Color(0xFF1F2937);
  static const Color onSurface = Color(0xFF1F2937);
  static const Color onSurfaceVariant = Color(0xFF6B7280);

  // Colores de estado
  static const Color error = Color(0xFFEF4444);
  static const Color onError = Colors.white;
  static const Color warning = Color(0xFFF59E0B);
  static const Color success = Color(0xFF10B981);
  static const Color info = Color(0xFF3B82F6);

  // Colores neutros
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);

  // Colores para gradientes
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryLight, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondaryLight, secondaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
