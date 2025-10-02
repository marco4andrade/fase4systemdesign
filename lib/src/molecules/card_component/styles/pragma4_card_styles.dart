import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_shadows.dart';
import '../../../atoms/atoms.dart';
import '../../../enums/enums.dart';

/// Helper de estilos para componentes de tarjeta
class Pragma4CardStyles {
  Pragma4CardStyles._();

  /// Construye la decoración principal de la tarjeta
  static BoxDecoration buildCardDecoration({
    Color? backgroundColor,
    double borderRadius = 12.0,
    double elevation = 2,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? Pragma4Colors.surface,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: elevation > 0 ? getShadow(elevation) : null,
    );
  }

  /// Obtiene la sombra según el nivel de elevación
  static List<BoxShadow> getShadow(double elevation) {
    if (elevation <= 1) return Pragma4Shadows.sm;
    if (elevation <= 3) return Pragma4Shadows.md;
    if (elevation <= 6) return Pragma4Shadows.lg;
    return Pragma4Shadows.xl;
  }

  /// Construye el border radius para imágenes
  static BorderRadius getImageBorderRadius({
    required bool fullWidth,
    required double borderRadius,
  }) {
    return fullWidth
        ? BorderRadius.vertical(top: Radius.circular(borderRadius))
        : BorderRadius.circular(borderRadius);
  }

  /// Construye el widget de imagen con manejo de errores
  static Widget buildImageWidget({
    required bool fullWidth,
    required double borderRadius,
    required double imageHeight,
    String? imageUrl,
    Widget? image,
    BoxFit imageFit = BoxFit.cover,
  }) {
    final BorderRadius radius = getImageBorderRadius(
      fullWidth: fullWidth,
      borderRadius: borderRadius,
    );

    final Widget inner = image ??
        (imageUrl != null && imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                height: fullWidth ? imageHeight : 56.0,
                width: fullWidth ? double.infinity : 56.0,
                fit: imageFit,
                errorBuilder: (context, error, stackTrace) {
                  return buildImagePlaceholder(fullWidth, imageHeight);
                },
              )
            : buildImagePlaceholder(fullWidth, imageHeight));

    return ClipRRect(
      borderRadius: radius,
      child: inner,
    );
  }

  /// Construye el placeholder para imágenes
  static Widget buildImagePlaceholder(bool fullWidth, double imageHeight) {
    return Container(
      height: fullWidth ? imageHeight : 56.0,
      width: fullWidth ? double.infinity : 56.0,
      color: Pragma4Colors.grey200,
      child: const Center(
        child: Pragma4Icon(
          Icons.broken_image,
          size: Pragma4ComponentSize.large,
          semanticColor: Pragma4Colors.onSurfaceVariant,
        ),
      ),
    );
  }

  /// Construye la sección de título con leading y trailing
  static Widget buildTitleSection({
    String? title,
    String? subtitle,
    Widget? leading,
    Widget? trailing,
    bool imageOnTop = true,
    String? imageUrl,
    Widget? image,
    required double borderRadius,
    required double imageHeight,
    BoxFit imageFit = BoxFit.cover,
  }) {
    return Row(
      children: [
        if (!imageOnTop && (image != null || imageUrl != null) && leading == null) ...[
          buildImageWidget(
            fullWidth: false,
            borderRadius: borderRadius,
            imageHeight: imageHeight,
            imageUrl: imageUrl,
            image: image,
            imageFit: imageFit,
          ),
          const SizedBox(width: 8.0),
        ],
        if (leading != null) ...[
          leading,
          const SizedBox(width: 8.0),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Pragma4Text(title, variant: Pragma4TextType.headlineSmall),
              if (subtitle != null) ...[
                if (title != null) const SizedBox(height: 4.0),
                Pragma4Text(
                  subtitle,
                  variant: Pragma4TextType.bodyMedium,
                  semanticColor: Pragma4ComponentColor.muted,
                ),
              ],
            ],
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: 8.0),
          trailing,
        ],
      ],
    );
  }
}