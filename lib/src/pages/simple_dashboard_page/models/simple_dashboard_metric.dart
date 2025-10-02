import 'package:flutter/material.dart';

/// Modelo para métricas del dashboard
class SimpleDashboardMetric {
  const SimpleDashboardMetric({
    required this.title,
    required this.value,
    required this.icon,
    this.subtitle,
    this.color,
    this.onTap,
  });

  final String title;
  final String value;
  final IconData icon;
  final String? subtitle;
  final Color? color;
  final VoidCallback? onTap;

  /// Verifica si la métrica tiene subtítulo
  bool get hasSubtitle => subtitle != null && subtitle!.isNotEmpty;

  /// Verifica si la métrica es interactiva
  bool get isInteractive => onTap != null;

  /// Crea una copia con valores actualizados
  SimpleDashboardMetric copyWith({
    String? title,
    String? value,
    IconData? icon,
    String? subtitle,
    Color? color,
    VoidCallback? onTap,
  }) {
    return SimpleDashboardMetric(
      title: title ?? this.title,
      value: value ?? this.value,
      icon: icon ?? this.icon,
      subtitle: subtitle ?? this.subtitle,
      color: color ?? this.color,
      onTap: onTap ?? this.onTap,
    );
  }
}