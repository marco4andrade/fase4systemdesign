import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';
import '../../widgets/design_level_card.dart';

/// Página de resumen del showcase.
class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Pragma4Text(
            'Bienvenido al Sistema de Diseño',
            variant: Pragma4TextType.displayMedium,
          ),
          const SizedBox(height: 16),
          const Pragma4Text(
            'Esta muestra demuestra un sistema de diseño completo construido usando principios de Atomic Design.',
            variant: Pragma4TextType.bodyLarge,
          ),
          const SizedBox(height: 32),
          Pragma4DashboardStats(
            stats: const [
              Pragma4StatCard(
                title: 'Átomos',
                value: '10+',
                subtitle: 'Componentes básicos',
                icon: Icons.settings,
              ),
              Pragma4StatCard(
                title: 'Moléculas',
                value: '8+',
                subtitle: 'Componentes combinados',
                icon: Icons.category,
              ),
              Pragma4StatCard(
                title: 'Organismos',
                value: '6+',
                subtitle: 'Secciones complejas',
                icon: Icons.widgets,
              ),
              Pragma4StatCard(
                title: 'Plantillas',
                value: '4+',
                subtitle: 'Diseños de página',
                icon: Icons.view_module,
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Pragma4Text(
            'Niveles de Atomic Design',
            variant: Pragma4TextType.headlineLarge,
          ),
          const SizedBox(height: 16),
          DesignLevelCard(
            title: 'Átomos',
            description: 'Bloques de construcción básicos como botones, campos de entrada y texto',
            icon: Icons.settings,
            color: colorScheme.primary,
          ),
          DesignLevelCard(
            title: 'Moléculas',
            description: 'Combinaciones simples de átomos trabajando juntos',
            icon: Icons.category,
            color: colorScheme.secondary,
          ),
          DesignLevelCard(
            title: 'Organismos',
            description: 'Componentes de UI complejos construidos a partir de moléculas y átomos',
            icon: Icons.widgets,
            color: colorScheme.secondary,
          ),
          DesignLevelCard(
            title: 'Plantillas',
            description: 'Diseños de página que proporcionan estructura para el contenido',
            icon: Icons.view_module,
            color: colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
