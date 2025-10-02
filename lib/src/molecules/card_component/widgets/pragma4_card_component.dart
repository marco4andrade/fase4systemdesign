import 'package:flutter/material.dart';
import '../styles/pragma4_card_styles.dart';

/// Molécula de componente tarjeta con estructura flexible de contenido
class Pragma4CardComponent extends StatelessWidget {
  const Pragma4CardComponent({
    super.key,
    this.header,
    this.title,
    this.subtitle,
    this.content,
    this.footer,
    this.leading,
    this.trailing,
    this.onTap,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.all(8.0),
    this.elevation = 2,
    this.backgroundColor,
    this.borderRadius = 12.0,
    this.imageUrl,
    this.image,
    this.imageHeight = 200,
    this.imageFit = BoxFit.cover,
    this.imageOnTop = true,
  });

  final Widget? header;
  final String? title;
  final String? subtitle;
  final Widget? content;
  final Widget? footer;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double elevation;
  final Color? backgroundColor;
  final double borderRadius;
  // Imagen opcional
  final String? imageUrl;
  final Widget? image;
  final double imageHeight;
  final BoxFit imageFit;
  final bool imageOnTop;

  @override
  Widget build(BuildContext context) {
    final Widget? headerWidget = header ??
        ((imageOnTop && (image != null || imageUrl != null))
            ? Pragma4CardStyles.buildImageWidget(
                fullWidth: true,
                borderRadius: borderRadius,
                imageHeight: imageHeight,
                imageUrl: imageUrl,
                image: image,
                imageFit: imageFit,
              )
            : null);

    return Container(
      margin: margin,
      decoration: Pragma4CardStyles.buildCardDecoration(
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
        elevation: elevation,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (headerWidget != null) ...[
                  headerWidget,
                  const SizedBox(height: 8.0),
                ],
                if (_shouldShowTitleSection())
                  Pragma4CardStyles.buildTitleSection(
                    title: title,
                    subtitle: subtitle,
                    leading: leading,
                    trailing: trailing,
                    imageOnTop: imageOnTop,
                    imageUrl: imageUrl,
                    image: image,
                    borderRadius: borderRadius,
                    imageHeight: imageHeight,
                    imageFit: imageFit,
                  ),
                if (content != null) ...[
                  if (title != null || subtitle != null)
                    const SizedBox(height: 8.0),
                  content!,
                ],
                if (footer != null) ...[
                  const SizedBox(height: 8.0),
                  footer!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _shouldShowTitleSection() {
    return title != null ||
        subtitle != null ||
        leading != null ||
        trailing != null ||
        (!imageOnTop && (image != null || imageUrl != null));
  }
  
  /// Calcula padding responsivo basado en las restricciones disponibles
  EdgeInsets _calculateResponsivePadding(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;
    final area = width * height;
    
    // Padding adaptativo basado en el área disponible
    if (area < 10000) {
      // Espacio muy limitado
      return const EdgeInsets.all(6.0);
    } else if (area < 20000) {
      // Espacio limitado
      return const EdgeInsets.all(8.0);
    } else if (width < 150 || height < 80) {
      // Dimensiones compactas
      return const EdgeInsets.all(10.0);
    } else if (width < 200 || height < 120) {
      // Dimensiones medianas
      return const EdgeInsets.all(12.0);
    } else {
      // Usar padding original para espacios amplios
      return padding;
    }
  }
  
  /// Calcula espaciado vertical responsivo
  double _calculateVerticalSpacing(BoxConstraints constraints) {
    final height = constraints.maxHeight;
    
    if (height < 60) {
      return 2.0; // Spacing mínimo
    } else if (height < 100) {
      return 4.0; // Spacing reducido
    } else if (height < 150) {
      return 6.0; // Spacing intermedio
    } else {
      return 8.0; // Spacing estándar
    }
  }
  
  /// Calcula altura de imagen responsiva
  double _calculateResponsiveImageHeight(BoxConstraints constraints) {
    final height = constraints.maxHeight;
    final maxImageHeight = height * 0.4; // Máximo 40% de la altura total
    
    // Usar la altura más pequeña entre la configurada y la calculada
    return imageHeight > maxImageHeight ? maxImageHeight : imageHeight;
  }
}