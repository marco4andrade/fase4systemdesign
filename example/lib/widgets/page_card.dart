import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';
import '../routes/app_routes.dart';

/// Widget que representa una tarjeta de página navegable
/// Utilizado para crear tarjetas que navegan a diferentes secciones de la app
class PageCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String route;
  final bool isDemoPage;

  const PageCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.route,
    this.isDemoPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Pragma4CardComponent(
        onTap: () => AppRoutes.navigateTo(context, route),
        content: Pragma4ListItem(
          showDecoration: false,
          title: title,
          subtitle: description,
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isDemoPage
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Pragma4Icon(icon, color: Colors.white),
          ),
          trailing: const Pragma4Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}