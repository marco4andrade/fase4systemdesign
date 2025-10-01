import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';

/// Widget que representa una sección de template con preview
/// Utilizado para mostrar demos de templates reutilizables
class TemplateSection extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;

  const TemplateSection({
    super.key,
    required this.title,
    required this.description,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Pragma4CardComponent(
        title: title,
        subtitle: description,
        content: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(color: Colors.green, child: child),
        ),
      ),
    );
  }
}