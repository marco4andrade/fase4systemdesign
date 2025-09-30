import 'package:flutter/material.dart';
import '../atoms/atoms.dart';
import '../molecules/molecules.dart';
import '../theme/app_colors.dart';

/// Modelo simple para métricas del dashboard
class SimpleDashboardMetric {
  const SimpleDashboardMetric({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;
}

/// Página de dashboard simple y reutilizable
class SimpleDashboardPage extends StatelessWidget {
  const SimpleDashboardPage({
    super.key,
    required this.title,
    this.subtitle = 'Panel de control',
    this.metrics = const [],
    this.onMenuTap,
    this.onNotificationTap,
    this.backgroundColor,
    this.children = const [],
  });

  final String title;
  final String subtitle;
  final List<SimpleDashboardMetric> metrics;
  final VoidCallback? onMenuTap;
  final VoidCallback? onNotificationTap;
  final Color? backgroundColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Pragma4Colors.background,
      appBar: AppBar(
        title: Pragma4HeadlineText(
          title,
          variant: Pragma4TextVariant.headlineSmall,
        ),
        backgroundColor: Pragma4Colors.surface,
        elevation: 0,
        leading: onMenuTap != null
            ? IconButton(
                icon: const Pragma4Icon(Icons.menu),
                onPressed: onMenuTap,
              )
            : null,
        actions: [
          if (onNotificationTap != null)
            IconButton(
              icon: const Pragma4Icon(Icons.notifications_outlined),
              onPressed: onNotificationTap,
            ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Pragma4HeadlineText(
              'Bienvenido',
              variant: Pragma4TextVariant.headlineMedium,
            ),
            const SizedBox(height: 4.0),
            Pragma4BodyText(subtitle, color: Pragma4Colors.onSurfaceVariant),
            const SizedBox(height: 24.0),
            // Sección de métricas
            if (metrics.isNotEmpty) ...[
              const Pragma4HeadlineText(
                'Resumen',
                variant: Pragma4TextVariant.headlineSmall,
              ),
              const SizedBox(height: 16.0),
              _buildMetricsGrid(),
              const SizedBox(height: 24.0),
            ],

            // Slot de contenido personalizado
            ...children.map(
              (child) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 1.5,
      ),
      itemCount: metrics.length,
      itemBuilder: (context, index) {
        final metric = metrics[index];
        return Pragma4CardComponent(
          padding: const EdgeInsets.all(16.0),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Pragma4Icon(metric.icon, color: Pragma4Colors.primary),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 8.0),
              Pragma4HeadlineText(
                metric.value,
                variant: Pragma4TextVariant.headlineMedium,
              ),
              const SizedBox(height: 4.0),
              Pragma4BodyText(
                metric.title,
                variant: Pragma4TextVariant.bodySmall,
                color: Pragma4Colors.onSurfaceVariant,
              ),
            ],
          ),
        );
      },
    );
  }
}
