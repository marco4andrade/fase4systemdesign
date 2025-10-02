import 'package:fase4_system_design/fase4_system_design.dart';
import 'package:flutter/material.dart';
import '../widgets/component_section.dart';

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
            variant: Pragma4TextType.displayMedium,
          ),
          const SizedBox(height: 16),
          const Pragma4Text(
            'Bloques de construcción básicos del sistema de diseño',
            variant: Pragma4TextType.bodyLarge,
          ),
          const SizedBox(height: 32),

          ComponentSection(
            title: 'Botones',
            children: [
              Pragma4Button(text: 'Primario', onPressed: () {}),
              Pragma4Button(
                text: 'Secundario',
                onPressed: () {},
                variant: Pragma4ComponentVariant.secondary,
              ),
              Pragma4Button(
                text: 'Contorno',
                onPressed: () {},
                variant: Pragma4ComponentVariant.outline,
              ),
              Pragma4Button(
                text: 'Peligro',
                onPressed: () {},
                variant: Pragma4ComponentVariant.danger,
              ),
            ],
          ),

          // Textos
          ComponentSection(
            title: 'Tipografía',
            children: const [
              Pragma4Text(
                'Título Grande',
                variant: Pragma4TextType.displayLarge,
              ),
              Pragma4Text(
                'Titular Mediano',
                variant: Pragma4TextType.headlineMedium,
              ),
              Pragma4Text('Cuerpo Grande', variant: Pragma4TextType.bodyLarge),
              Pragma4Text(
                'Etiqueta Mediana',
                variant: Pragma4TextType.labelMedium,
              ),
            ],
          ),

          // Iconos
          ComponentSection(
            title: 'Iconos',
            children: [
              Pragma4Icon(Icons.home),
              Pragma4Icon(
                Icons.favorite,
                semanticColor: Theme.of(context).colorScheme.error,
              ),
              Pragma4Icon(
                Icons.star,
                semanticColor: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),

          // Badges
          ComponentSection(
            title: 'Etiquetas',
            children: [
              Pragma4Badge(text: 'Nuevo'),
              Pragma4Badge(text: 'Éxito', variant: Pragma4ComponentVariant.primary),
              Pragma4Badge(text: 'Error', variant: Pragma4ComponentVariant.danger),
            ],
          ),
        ],
      ),
    );
  }
}
