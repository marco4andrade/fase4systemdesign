import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../molecules/molecules.dart';
import '../../../theme/app_colors.dart';
import '../../../enums/enums.dart';
import '../models/simple_dashboard_metric.dart';
import '../styles/dashboard_styles.dart';

/// Grid de métricas del dashboard
class DashboardMetricsGrid extends StatelessWidget {
  const DashboardMetricsGrid({
    super.key,
    required this.metrics,
    this.sectionTitle = 'Resumen',
    this.crossAxisCount = DashboardStyles.metricsGridCrossAxisCount,
    this.crossAxisSpacing = DashboardStyles.metricsGridCrossAxisSpacing,
    this.mainAxisSpacing = DashboardStyles.metricsGridMainAxisSpacing,
    this.childAspectRatio = DashboardStyles.metricsGridChildAspectRatio,
  });

  final List<SimpleDashboardMetric> metrics;
  final String sectionTitle;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    if (metrics.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: DashboardStyles.mainCrossAxisAlignment,
      children: [
        Pragma4Text(
          sectionTitle,
          variant: Pragma4TextType.headlineSmall,
        ),
        const SizedBox(height: DashboardStyles.metricsSpacing),
        _buildGrid(),
      ],
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      shrinkWrap: DashboardStyles.gridShrinkWrap,
      physics: DashboardStyles.gridScrollPhysics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: metrics.length,
      itemBuilder: (context, index) => _buildMetricCard(metrics[index]),
    );
  }

  Widget _buildMetricCard(SimpleDashboardMetric metric) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double h = constraints.maxHeight;
        final bool veryCompact = h < 90; // Altura muy limitada
        final bool compact = h < 120;    // Altura limitada

        // Seleccionar variantes de texto según la altura disponible
        Pragma4TextType valueVariant;
        if (veryCompact) {
          valueVariant = Pragma4TextType.headlineSmall;
        } else if (compact) {
          valueVariant = Pragma4TextType.headlineSmall;
        } else {
          valueVariant = Pragma4TextType.headlineMedium;
        }

        final EdgeInsets adaptivePadding = compact
            ? const EdgeInsets.all(12)
            : DashboardStyles.metricCardPadding;

        // Spacings adaptativos
        double gapSmall() => veryCompact ? 2 : compact ? 4 : DashboardStyles.metricContentSpacing;
        double gapIcon() => veryCompact ? 4 : compact ? 6 : DashboardStyles.metricIconSpacing;

        return Pragma4CardComponent(
          padding: adaptivePadding,
          onTap: metric.isInteractive ? metric.onTap : null,
          // El contenido interno se adapta para no producir overflow vertical
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Fila de icono (oculta el spacer para ahorrar altura)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Pragma4Icon(
                    metric.icon,
                    color: metric.color ?? const Color.fromARGB(255, 26, 199, 35),
                    size: compact ? Pragma4ComponentSize.small : Pragma4ComponentSize.medium,
                  ),
                ],
              ),
              SizedBox(height: gapIcon()),

              // Valor principal escalable para no desbordar
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Pragma4Text(
                  metric.value,
                  variant: valueVariant,
                ),
              ),
              SizedBox(height: gapSmall()),

              // Título (con ellipsis y 1 línea si muy compacto)
              Pragma4Text(
                metric.title,
                variant: Pragma4TextType.bodySmall,
                color: Pragma4Colors.onSurfaceVariant,
                maxLines: veryCompact ? 1 : 2,
                overflow: TextOverflow.ellipsis,
              ),

              // Subtítulo opcional (se oculta si el alto es muy limitado)
              if (metric.hasSubtitle && !veryCompact) ...[
                SizedBox(height: gapSmall()),
                Pragma4Text(
                  metric.subtitle!,
                  variant: Pragma4TextType.labelSmall,
                  semanticColor: Pragma4ComponentColor.muted,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}