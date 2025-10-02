import 'package:flutter/material.dart';

/// Helper de estilos para el dashboard simple
class DashboardStyles {
  DashboardStyles._();

  // Espaciados principales
  static const double mainPadding = 16.0;
  static const double welcomeSectionSpacing = 24.0;
  static const double titleSpacing = 4.0;
  static const double metricsSpacing = 16.0;
  static const double childrenSpacing = 16.0;
  static const double appBarRightSpacing = 8.0;

  // Configuraciones del grid de métricas
  static const int metricsGridCrossAxisCount = 2;
  static const double metricsGridCrossAxisSpacing = 16.0;
  static const double metricsGridMainAxisSpacing = 16.0;
  static const double metricsGridChildAspectRatio = 1.5;

  // Configuraciones de las tarjetas de métricas
  static const EdgeInsets metricCardPadding = EdgeInsets.all(16.0);
  static const double metricIconSpacing = 8.0;
  static const double metricContentSpacing = 4.0;

  // Configuraciones de AppBar
  static const double appBarElevation = 0.0;

  // Configuraciones de layout
  static const CrossAxisAlignment mainCrossAxisAlignment = CrossAxisAlignment.start;
  static const MainAxisAlignment spacerAlignment = MainAxisAlignment.spaceBetween;

  // Configuraciones de scroll
  static const ScrollPhysics gridScrollPhysics = NeverScrollableScrollPhysics();

  // Configuraciones de grid
  static const bool gridShrinkWrap = true;
}