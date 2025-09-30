import 'package:flutter/material.dart';
import '../atoms/atoms.dart';
import 'card_component.dart';
import '../theme/app_colors.dart';

/// Molécula de tarjeta de estadísticas para mostrar métricas
class Pragma4StatCard extends StatelessWidget {
  const Pragma4StatCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    this.icon,
    this.trend,
    this.onTap,
  });

  final String title;
  final String value;
  final String? subtitle;
  final IconData? icon;
  final Pragma4StatTrend? trend;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Pragma4CardComponent(
      onTap: onTap,
      padding: const EdgeInsets.all(24.0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Pragma4Text(
                  title,
                  variant: Pragma4TextVariant.labelMedium,
                  semanticColor: Pragma4TextColor.tertiary,
                ),
              ),
              if (icon != null)
                Pragma4Icon(
                  icon!,
                  size: Pragma4IconSize.small,
                  semanticColor: Pragma4Colors.onSurfaceVariant,
                ),
            ],
          ),
          const SizedBox(height: 8.0),
          Pragma4Text(value, variant: Pragma4TextVariant.displaySmall),
          if (subtitle != null || trend != null) ...[
            const SizedBox(height: 4.0),
            Row(
              children: [
                if (trend != null) ...[
                  Pragma4Icon(
                    trend!.isPositive ? Icons.trending_up : Icons.trending_down,
                    size: Pragma4IconSize.small,
                    semanticColor: trend!.isPositive
                        ? Pragma4Colors.success
                        : Pragma4Colors.error,
                  ),
                  const SizedBox(width: 4.0),
                  Pragma4Text(
                    trend!.percentage,
                    variant: Pragma4TextVariant.labelSmall,
                    semanticColor: trend!.isPositive
                        ? Pragma4TextColor.success
                        : Pragma4TextColor.error,
                  ),
                  if (subtitle != null) const SizedBox(width: 8.0),
                ],
                if (subtitle != null)
                  Expanded(
                    child: Pragma4Text(
                      subtitle!,
                      variant: Pragma4TextVariant.bodySmall,
                      semanticColor: Pragma4TextColor.tertiary,
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Datos de tendencia de la estadística
class Pragma4StatTrend {
  const Pragma4StatTrend({required this.percentage, required this.isPositive});

  final String percentage;
  final bool isPositive;
}
