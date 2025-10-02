import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../models/simple_dashboard_metric.dart';
import '../styles/dashboard_styles.dart';
import 'dashboard_app_bar.dart';
import 'dashboard_welcome_section.dart';
import 'dashboard_metrics_grid.dart';

/// Página de dashboard simple y reutilizable modularizada
class SimpleDashboardPage extends StatelessWidget {
  const SimpleDashboardPage({
    super.key,
    required this.title,
    this.subtitle = 'Panel de control',
    this.welcomeTitle = 'Bienvenido',
    this.metricsTitle = 'Resumen',
    this.metrics = const [],
    this.onMenuTap,
    this.onNotificationTap,
    this.backgroundColor,
    this.children = const [],
    this.showMenuButton = true,
    this.showNotificationButton = true,
    this.showWelcomeSection = true,
  });

  final String title;
  final String subtitle;
  final String welcomeTitle;
  final String metricsTitle;
  final List<SimpleDashboardMetric> metrics;
  final VoidCallback? onMenuTap;
  final VoidCallback? onNotificationTap;
  final Color? backgroundColor;
  final List<Widget> children;
  final bool showMenuButton;
  final bool showNotificationButton;
  final bool showWelcomeSection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Pragma4Colors.background,
      appBar: DashboardAppBar(
        title: title,
        onMenuTap: onMenuTap,
        onNotificationTap: onNotificationTap,
        showMenuButton: showMenuButton,
        showNotificationButton: showNotificationButton,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DashboardStyles.mainPadding),
        child: Column(
          crossAxisAlignment: DashboardStyles.mainCrossAxisAlignment,
          children: [
            // Sección de bienvenida
            if (showWelcomeSection) ...[
              DashboardWelcomeSection(
                welcomeTitle: welcomeTitle,
                subtitle: subtitle,
              ),
              const SizedBox(height: DashboardStyles.welcomeSectionSpacing),
            ],

            // Sección de métricas
            if (metrics.isNotEmpty) ...[
              DashboardMetricsGrid(
                metrics: metrics,
                sectionTitle: metricsTitle,
              ),
              const SizedBox(height: DashboardStyles.welcomeSectionSpacing),
            ],

            // Contenido personalizado
            ...children.map(
              (child) => Padding(
                padding: const EdgeInsets.only(
                  bottom: DashboardStyles.childrenSpacing,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}