import 'package:flutter/material.dart';
import '../atoms/atoms.dart';
import '../theme/app_colors.dart';
import '../theme/app_shadows.dart';

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
      ? _buildImageWidget(fullWidth: true)
      : null);

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ?? Pragma4Colors.surface,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: elevation > 0 ? _getShadow() : null,
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
        if (title != null ||
          subtitle != null ||
          leading != null ||
          trailing != null ||
          (!imageOnTop && (image != null || imageUrl != null)))
                  _buildTitleSection(),
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

  Widget _buildTitleSection() {
    return Row(
      children: [
        if (!imageOnTop && (image != null || imageUrl != null) && leading == null) ...[
          _buildImageWidget(fullWidth: false),
          const SizedBox(width: 8.0), // sm
        ],
        if (leading != null) ...[
          leading!,
          const SizedBox(width: 8.0), // sm
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Pragma4Text(title!, variant: Pragma4TextVariant.headlineSmall),
              if (subtitle != null) ...[
                if (title != null) const SizedBox(height: 4.0), // xs
                Pragma4Text(
                  subtitle!,
                  variant: Pragma4TextVariant.bodyMedium,
                  semanticColor: Pragma4TextColor.tertiary,
                ),
              ],
            ],
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: 8.0), // sm
          trailing!,
        ],
      ],
    );
  }

  Widget _buildImageWidget({required bool fullWidth}) {
    final BorderRadius radius = fullWidth
        ? BorderRadius.vertical(top: Radius.circular(borderRadius))
        : BorderRadius.circular(borderRadius);

    final Widget inner = image ??
        (imageUrl != null && imageUrl!.isNotEmpty
            ? Image.network(
                imageUrl!,
                height: fullWidth ? imageHeight : 56.0,
                width: fullWidth ? double.infinity : 56.0,
                fit: imageFit,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: fullWidth ? imageHeight : 56.0,
                    width: fullWidth ? double.infinity : 56.0,
                    color: Pragma4Colors.grey200,
                    child: const Center(
                      child: Pragma4Icon(
                        Icons.broken_image,
                        size: Pragma4IconSize.large,
                        semanticColor: Pragma4Colors.onSurfaceVariant,
                      ),
                    ),
                  );
                },
              )
            : Container(
                height: fullWidth ? imageHeight : 56.0,
                width: fullWidth ? double.infinity : 56.0,
                color: Pragma4Colors.grey200,
                child: const Center(
                  child: Pragma4Icon(
                    Icons.broken_image,
                    size: Pragma4IconSize.large,
                    semanticColor: Pragma4Colors.onSurfaceVariant,
                  ),
                ),
              ));

    return ClipRRect(
      borderRadius: radius,
      child: inner,
    );
  }


  List<BoxShadow> _getShadow() {
    if (elevation <= 1) return Pragma4Shadows.sm;
    if (elevation <= 3) return Pragma4Shadows.md;
    if (elevation <= 6) return Pragma4Shadows.lg;
    return Pragma4Shadows.xl;
  }
}

