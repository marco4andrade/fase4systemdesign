import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/login_example_page.dart';
import '../pages/dashboard_example_page.dart';
import '../pages/showcase_example_page.dart';

/// Clase que define todas las rutas de la aplicación
class AppRoutes {
  // Nombres de las rutas
  static const String home = '/';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String showcase = '/showcase';

  /// Mapa de rutas de la aplicación
  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomePage(),
        login: (context) => const LoginExamplePage(),
        dashboard: (context) => const DashboardExamplePage(),
        showcase: (context) => const ShowcaseExamplePage(),
      };

  /// Navegar a una ruta específica
  static Future<void> navigateTo(BuildContext context, String routeName) {
    return Navigator.pushNamed(context, routeName);
  }

  /// Navegar a una ruta específica reemplazando la actual
  static Future<void> navigateToAndReplace(BuildContext context, String routeName) {
    return Navigator.pushReplacementNamed(context, routeName);
  }

  /// Volver a la página anterior
  static void goBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  /// Volver al home limpiando todo el stack
  static void goToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      home,
      (route) => false,
    );
  }
}