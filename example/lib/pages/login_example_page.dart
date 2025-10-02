import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';
import '../routes/app_routes.dart';

/// Página de ejemplo que muestra cómo usar la LoginPage reutilizable
class LoginExamplePage extends StatelessWidget {
  const LoginExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Pragma4Icon(Icons.arrow_back),
          onPressed: () => AppRoutes.goBack(context),
        ),
        title: const Pragma4HeadlineText(
          'Página de Login',
          variant: Pragma4TextType.headlineSmall,
        ),
        actions: [
          IconButton(
            icon: const Pragma4Icon(Icons.home),
            onPressed: () => AppRoutes.goToHome(context),
          ),
        ],
      ),
      body: LoginPage(
        title: 'Iniciar Sesión',
        subtitle: 'Ejemplo de página reutilizable',
        onLogin: (email, password, rememberMe) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login: $email')),
          );
        },
        onForgotPassword: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Recuperar contraseña')),
          );
        },
        onSignUp: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Ir a registro')),
          );
        },
      ),
    );
  }
}