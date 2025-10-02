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
              // Badges de texto
              Pragma4Badge(text: 'Nuevo'),
              Pragma4Badge(text: 'Éxito', variant: Pragma4ComponentVariant.primary),
              Pragma4Badge(text: 'Error', variant: Pragma4ComponentVariant.danger),
              
              const SizedBox(height: 16),
              
              // Badges de punto (dot badges)
              Row(
                children: [
                  const Pragma4Text('Notificaciones: ', variant: Pragma4TextType.bodyMedium),
                  const SizedBox(width: 8),
                  const Pragma4DotBadge(variant: Pragma4ComponentVariant.danger),
                  const SizedBox(width: 16),
                  const Pragma4Text('En línea: ', variant: Pragma4TextType.bodyMedium),
                  const SizedBox(width: 8),
                  const Pragma4DotBadge(variant: Pragma4ComponentVariant.success),
                  const SizedBox(width: 16),
                  const Pragma4Text('Pendiente: ', variant: Pragma4TextType.bodyMedium),
                  const SizedBox(width: 8),
                  const Pragma4DotBadge(variant: Pragma4ComponentVariant.warning),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Badges numéricos
              Row(
                children: [
                  const Pragma4Text('Mensajes: ', variant: Pragma4TextType.bodyMedium),
                  const SizedBox(width: 8),
                  const Pragma4NumberBadge(count: 5),
                  const SizedBox(width: 16),
                  const Pragma4Text('Notificaciones: ', variant: Pragma4TextType.bodyMedium),
                  const SizedBox(width: 8),
                  const Pragma4NumberBadge(count: 99),
                  const SizedBox(width: 16),
                  const Pragma4Text('Muchas: ', variant: Pragma4TextType.bodyMedium),
                  const SizedBox(width: 8),
                  const Pragma4NumberBadge(count: 150, maxCount: 99),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
