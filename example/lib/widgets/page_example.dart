import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';

/// Widget que representa un ejemplo de página con preview
/// Utilizado para mostrar demos de páginas reutilizables
class PageExample extends StatelessWidget {
  final String title;
  final String description;
  final Widget preview;

  const PageExample({
    super.key,
    required this.title,
    required this.description,
    required this.preview,
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
          child: Material(color: Colors.green, child: preview),
        ),
      ),
    );
  }
}