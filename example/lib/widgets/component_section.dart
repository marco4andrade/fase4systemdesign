import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';

/// Widget que representa una sección de componentes con layout horizontal (Wrap)
/// Utilizado para mostrar componentes que se pueden organizar en filas y columnas
class ComponentSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ComponentSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
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