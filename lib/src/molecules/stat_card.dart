import 'package:flutter/material.dart';
import '../atoms/atoms.dart';
import 'card_component/card_component.dart';
import '../theme/app_colors.dart';
import '../enums/enums.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        // Padding responsivo basado en el ancho y alto disponible
        final padding = _getResponsivePadding(constraints.maxWidth, constraints.maxHeight);
        final isCompact = _isCompactLayout(constraints);
        
        return Pragma4CardComponent(
          onTap: onTap,
          padding: EdgeInsets.all(padding),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header con título e icono
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: Pragma4Text(
                        title,
                        variant: _getResponsiveTextVariant(constraints, isTitle: true),
                        semanticColor: Pragma4ComponentColor.muted,
                        maxLines: isCompact ? 1 : 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (icon != null && !isCompact) ...[
                      SizedBox(width: padding * 0.25),
                      Pragma4Icon(
                        icon!,
                        size: _getResponsiveIconSize(constraints),
                        semanticColor: Pragma4Colors.onSurfaceVariant,
                      ),
                    ],
                  ],
                ),
              ),
              
              // Espaciado dinámico
              SizedBox(height: _getVerticalSpacing(constraints, padding)),
              
              // Valor principal
              Flexible(
                flex: 2,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Pragma4Text(
                    value, 
                    variant: _getResponsiveTextVariant(constraints, isValue: true),
                    maxLines: 1,
                  ),
                ),
              ),
              
              // Subtitle y trend (solo si hay espacio)
              if ((subtitle != null || trend != null) && !_shouldHideSubtitle(constraints)) ...[
                SizedBox(height: _getVerticalSpacing(constraints, padding) * 0.5),
                Flexible(
                  child: Row(
                    children: [
                      if (trend != null) ...[
                        Pragma4Icon(
                          _getTrendIcon(trend!),
                          size: _getResponsiveIconSize(constraints),
                          color: _getTrendColor(trend!),
                        ),
                        SizedBox(width: padding * 0.2),
                      ],
                      if (subtitle != null)
                        Expanded(
                          child: Pragma4Text(
                            subtitle!,
                            variant: _getResponsiveTextVariant(constraints, isSubtitle: true),
                            semanticColor: Pragma4ComponentColor.muted,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
  
  double _getResponsivePadding(double width, double height) {
    // Considerar tanto ancho como alto para determinar el padding
    final area = width * height;
    
    if (area < 15000) return 6.0;   // Muy pequeño
    if (area < 25000) return 8.0;   // Pequeño
    if (width < 150 || height < 80) return 10.0;
    if (width < 200 || height < 100) return 12.0;
    if (width < 250 || height < 120) return 16.0;
    return 20.0; // Máximo padding reducido
  }
  
  Pragma4TextType _getResponsiveTextVariant(BoxConstraints constraints, {bool isTitle = false, bool isValue = false, bool isSubtitle = false}) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final isVeryCompact = width < 120 || height < 60;
    final isCompact = width < 180 || height < 80;
    
    if (isTitle) {
      if (isVeryCompact) return Pragma4TextType.labelSmall;
      return isCompact ? Pragma4TextType.labelSmall : Pragma4TextType.labelMedium;
    }
    if (isValue) {
      if (isVeryCompact) return Pragma4TextType.headlineSmall;
      if (isCompact) return Pragma4TextType.headlineSmall;
      if (width < 200 || height < 100) return Pragma4TextType.headlineMedium;
      return Pragma4TextType.displaySmall;
    }
    if (isSubtitle) {
      return isCompact ? Pragma4TextType.bodySmall : Pragma4TextType.bodySmall;
    }
    return Pragma4TextType.bodyMedium;
  }
  
  Pragma4ComponentSize _getResponsiveIconSize(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    
    if (width < 120 || height < 60) return Pragma4ComponentSize.small;
    if (width < 180 || height < 80) return Pragma4ComponentSize.small;
    return Pragma4ComponentSize.small; // Mantener small para evitar que ocupe mucho espacio
  }
  
  bool _isCompactLayout(BoxConstraints constraints) {
    return constraints.maxWidth < 150 || constraints.maxHeight < 70;
  }
  
  double _getVerticalSpacing(BoxConstraints constraints, double padding) {
    final height = constraints.maxHeight;
    if (height < 60) return 2.0;
    if (height < 80) return 4.0;
    if (height < 100) return 6.0;
    return padding * 0.25;
  }
  
  bool _shouldHideSubtitle(BoxConstraints constraints) {
    // Ocultar subtitle si el espacio es muy limitado
    return constraints.maxHeight < 50 || 
           (constraints.maxHeight < 70 && (subtitle?.length ?? 0) > 15);
  }

  IconData _getTrendIcon(Pragma4StatTrend trend) {
    switch (trend) {
      case Pragma4StatTrend.up:
        return Icons.trending_up;
      case Pragma4StatTrend.down:
        return Icons.trending_down;
      case Pragma4StatTrend.neutral:
        return Icons.trending_flat;
    }
  }

  Color _getTrendColor(Pragma4StatTrend trend) {
    switch (trend) {
      case Pragma4StatTrend.up:
        return Pragma4Colors.success;
      case Pragma4StatTrend.down:
        return Pragma4Colors.error;
      case Pragma4StatTrend.neutral:
        return Pragma4Colors.onSurfaceVariant;
    }
  }
}


