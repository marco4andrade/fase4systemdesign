import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';
import '../routes/app_routes.dart';
import '../widgets/page_card.dart';

/// Página de inicio que muestra el menú principal con todas las opciones disponibles
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const Center(
                child: Pragma4Text(
                  'Sistema de Diseño Flutter',
                  variant: Pragma4TextType.headlineLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Pragma4Text(
                  'Sistema basado en Atomic Design con páginas reutilizables y demostraciones',
                  color: Theme.of(context).colorScheme.onSurface,
                  textAlign: TextAlign.center,
                  variant: Pragma4TextType.bodyMedium,
                ),
              ),
              const SizedBox(height: 32),
              const Pragma4Text(
                'Páginas Reutilizables',
                variant: Pragma4TextType.headlineMedium,
              ),
              const SizedBox(height: 8),
              Pragma4Text(
                'Estas páginas están incluidas en el paquete y pueden ser reutilizadas en cualquier aplicación:',
                color: Theme.of(context).colorScheme.onSurface,
                variant: Pragma4TextType.bodyMedium,
              ),
              const SizedBox(height: 24),
              PageCard(
                title: 'Página de Login',
                description: 'Formulario de inicio de sesión completo con validaciones',
                icon: Icons.login,
                route: AppRoutes.login,
              ),
              PageCard(
                title: 'Dashboard Simple',
                description: 'Panel de control con métricas y contenido personalizable',
                icon: Icons.dashboard,
                route: AppRoutes.dashboard,
              ),
              const SizedBox(height: 24),
              const Pragma4Text(
                'Páginas de Demostración',
                variant: Pragma4TextType.headlineSmall,
              ),
              const SizedBox(height: 8),
              Pragma4Text(
                'Estas páginas están en el ejemplo y muestran cómo usar los componentes:',
                color: Theme.of(context).colorScheme.onSurface,
                variant: Pragma4TextType.bodyMedium,
              ),
              const SizedBox(height: 16),
              PageCard(
                title: 'Showcase Completo',
                description: 'Demostración de todos los componentes del sistema',
                icon: Icons.widgets,
                route: AppRoutes.showcase,
                isDemoPage: true,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}