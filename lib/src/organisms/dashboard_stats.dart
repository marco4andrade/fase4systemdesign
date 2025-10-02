import 'package:flutter/material.dart';
import '../molecules/molecules.dart';

/// Organismo de estadísticas del dashboard
class Pragma4DashboardStats extends StatelessWidget {
  const Pragma4DashboardStats({
    super.key,
    required this.stats,
    this.crossAxisCount,
    this.spacing = 16.0,
    this.minCardWidth = 200.0,
  });

  final List<Pragma4StatCard> stats;
  final int? crossAxisCount;
  final double spacing;
  final double minCardWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calcular crossAxisCount dinámicamente si no se especifica
        final effectiveCrossAxisCount = crossAxisCount ?? 
            (constraints.maxWidth / minCardWidth).floor().clamp(1, 4);
        
        // Aspect ratio dinámico basado en el tamaño de pantalla
        final aspectRatio = _calculateAspectRatio(constraints.maxWidth, effectiveCrossAxisCount);
        
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: effectiveCrossAxisCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: aspectRatio,
          ),
          itemCount: stats.length,
          itemBuilder: (context, index) => stats[index],
        );
      },
    );
  }
  
  double _calculateAspectRatio(double screenWidth, int columns) {
    // Aspect ratios mucho más generosos para evitar cualquier overflow
    // Considerando que ahora tenemos contenido con subtitle y trend
    if (screenWidth < 400) {
      // Móvil muy pequeño: extremadamente alto para evitar overflow
      return columns == 1 ? 1.4 : 1.0;
    } else if (screenWidth < 600) {
      // Móvil: muy alto para contenido con subtitle y trend
      return columns == 1 ? 1.8 : 1.2;
    } else if (screenWidth < 900) {
      // Tablet: aspect ratio intermedio pero generoso
      return columns <= 2 ? 1.5 : 1.2;
    } else {
      // Desktop: aspect ratio conservador pero con espacio suficiente
      return columns <= 3 ? 1.4 : 1.1;
    }
  }
}

