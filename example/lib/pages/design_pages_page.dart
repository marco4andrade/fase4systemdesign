import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';
import '../routes/app_routes.dart';

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
          const Pragma4Text(
            'Selecciona una página para verla en contexto completo:',
            variant: Pragma4TextType.bodyMedium,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              Pragma4Button(
                text: 'Ver LoginPage',
                onPressed: () => AppRoutes.navigateTo(context, AppRoutes.login),
              ),
              Pragma4Button(
                text: 'Ver DashboardPage',
                variant: Pragma4ComponentVariant.secondary,
                onPressed: () => AppRoutes.navigateTo(context, AppRoutes.dashboard),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
