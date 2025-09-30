import 'package:fase4_system_design/fase4_system_design.dart';
import 'package:flutter/material.dart';

/// Showcase de atomos
class AtomsPage extends StatelessWidget {
  const AtomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Pragma4Text(
            'Átomos',
            variant: Pragma4TextVariant.displayMedium,
          ),
          const SizedBox(height: 16),
          const Pragma4Text(
            'Bloques de construcción básicos del sistema de diseño',
            variant: Pragma4TextVariant.bodyLarge,
          ),
          const SizedBox(height: 32),

          _buildSection('Botones', [
            Pragma4Button(text: 'Primario', onPressed: () {}),
            Pragma4Button(
              text: 'Secundario',
              onPressed: () {},
              variant: Pragma4ButtonVariant.secondary,
            ),
            Pragma4Button(
              text: 'Contorno',
              onPressed: () {},
              variant: Pragma4ButtonVariant.outline,
            ),
            Pragma4Button(
              text: 'Peligro',
              onPressed: () {},
              variant: Pragma4ButtonVariant.danger,
            ),
          ]),

          // Textos
          _buildSection('Tipografía', const [
            Pragma4Text(
              'Título Grande',
              variant: Pragma4TextVariant.displayLarge,
            ),
            Pragma4Text(
              'Titular Mediano',
              variant: Pragma4TextVariant.headlineMedium,
            ),
            Pragma4Text('Cuerpo Grande', variant: Pragma4TextVariant.bodyLarge),
            Pragma4Text(
              'Etiqueta Mediana',
              variant: Pragma4TextVariant.labelMedium,
            ),
          ]),

          // Iconos
          _buildSection('Iconos', [
            Pragma4Icon(Icons.home),
            Pragma4Icon(
              Icons.favorite,
              semanticColor: Theme.of(context).colorScheme.error,
            ),
            Pragma4Icon(
              Icons.star,
              semanticColor: Theme.of(context).colorScheme.secondary,
            ),
          ]),

          // Badges
          _buildSection('Etiquetas', [
            Pragma4Badge(text: 'Nuevo'),
            Pragma4Badge(text: 'Éxito', variant: Pragma4BadgeVariant.success),
            Pragma4Badge(text: 'Error', variant: Pragma4BadgeVariant.error),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Pragma4Text(title, variant: Pragma4TextVariant.headlineMedium),
          const SizedBox(height: 16),
          Wrap(spacing: 16, runSpacing: 16, children: children),
        ],
      ),
    );
  }
}
