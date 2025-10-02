import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';
import '../widgets/page_example.dart';

/// Showcase para el nivel de Páginas reutilizables
class DesignPagesPage extends StatelessWidget {
  const DesignPagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Pragma4Text(
            'Páginas',
            variant: Pragma4TextType.displayMedium,
          ),
          const SizedBox(height: 16),
          const Pragma4Text(
            'Implementaciones reutilizables completas construidas con plantillas y organismos.',
            variant: Pragma4TextType.bodyLarge,
          ),
          const SizedBox(height: 32),
                    const SizedBox(height: 32),
          PageExample(
            title: 'LoginPage',
            description: 'Página de inicio de sesión lista para usar.',
            preview: SizedBox(
              height: 320,
              child: LoginPage(
                title: 'Mi App',
                subtitle: 'Inicia sesión en tu cuenta',
                onLogin: (email, password, rememberMe) {},
                onForgotPassword: () {},
                onSignUp: () {},
              ),
            ),
          ),
          PageExample(
            title: 'SimpleDashboardPage',
            description: 'Dashboard básico con métricas y contenido personalizable.',
            preview: SizedBox(
              height: 320,
              child: SimpleDashboardPage(
                title: 'Dashboard',
                subtitle: 'Vista general de métricas',
                metrics: const [
                  SimpleDashboardMetric(
                    title: 'Usuarios',
                    value: '1,234',
                    icon: Icons.people,
                  ),
                  SimpleDashboardMetric(
                    title: 'Ventas',
                    value: '\$5,678',
                    icon: Icons.attach_money,
                  ),
                ],
                onMenuTap: () {},
                onNotificationTap: () {},
                children: const [
                  Text('Contenido del dashboard aquí'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
