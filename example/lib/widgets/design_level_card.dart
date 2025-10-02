import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';

/// Widget que representa una tarjeta de nivel de diseño (Atomic Design)
/// Utilizado para mostrar información sobre átomos, moléculas, organismos, etc.
class DesignLevelCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const DesignLevelCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Pragma4CardComponent(
        leading: Pragma4Icon(icon, color: color, size: Pragma4ComponentSize.large),
        title: title,
        subtitle: description,
      ),
    );
  }
}