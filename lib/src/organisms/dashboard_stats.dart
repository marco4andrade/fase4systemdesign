import 'package:flutter/material.dart';
import '../molecules/molecules.dart';

/// Organismo de estadísticas del dashboard
class Pragma4DashboardStats extends StatelessWidget {
  const Pragma4DashboardStats({
    super.key,
    required this.stats,
    this.crossAxisCount = 2,
    this.spacing = 16.0,
  });

  final List<Pragma4StatCard> stats;
  final int crossAxisCount;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio:
            1.5, // Relación ancho/alto de cada tarjeta de estadística
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) => stats[index],
    );
  }
}

