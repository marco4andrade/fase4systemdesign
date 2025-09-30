import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';

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
            variant: Pragma4TextVariant.displayMedium,
          ),
          const SizedBox(height: 16),
          const Pragma4Text(
            'Implementaciones reutilizables completas construidas con plantillas y organismos.',
            variant: Pragma4TextVariant.bodyLarge,
          ),
          const SizedBox(height: 32),
          _buildPageExample(
            title: 'LoginPage',
            description: 'Página de inicio de sesión lista para usar.',
            preview: SizedBox(
              height: 320,
              child: LoginPage(
                title: 'Iniciar Sesión',
                subtitle: 'Accede a tu cuenta',
                onLogin: (e, p, r) {},
                onForgotPassword: () {},
                onSignUp: () {},
              ),
            ),
          ),
          _buildPageExample(
            title: 'SimpleDashboardPage',
            description: 'Panel simple con métricas y contenido configurable.',
            preview: SizedBox(
              height: 360,
              child: SimpleDashboardPage(
                title: 'Mi Panel',
                subtitle: 'Resumen general',
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
                children: const [
                  Pragma4CardComponent(
                    title: 'Actividad',
                    content: Pragma4BodyText('Sin eventos recientes'),
                  ),
                ],
                onMenuTap: () {},
                onNotificationTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageExample({
    required String title,
    required String description,
    required Widget preview,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Pragma4CardComponent(
        title: title,
        subtitle: description,
        content: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(color: Colors.green, child: preview),
        ),
      ),
    );
  }
}
