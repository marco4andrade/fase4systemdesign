import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';

/// Widget que representa una sección de componentes con layout vertical
/// Utilizado para mostrar componentes apilados verticalmente con espaciado
class ComponentSectionVertical extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ComponentSectionVertical({
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
          Pragma4Text(title, variant: Pragma4TextType.headlineMedium),
          const SizedBox(height: 16),
          ...children.map(
            (child) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}