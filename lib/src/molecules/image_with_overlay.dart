import 'package:flutter/material.dart';
import '../atoms/atoms.dart';

/// Molécula de imagen con superposición
class Pragma4ImageWithOverlay extends StatelessWidget {
  const Pragma4ImageWithOverlay({
    super.key,
    required this.imageUrl,
    this.overlay,
    this.height = 200,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
  this.borderRadius = 8.0,
  });

  final String imageUrl;
  final Widget? overlay;
  final double height;
  final double width;
  final BoxFit fit;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: fit,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Pragma4Icon(Icons.broken_image),
                  ),
                );
              },
            ),
            if (overlay != null)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.7),
                    ],
                  ),
                ),
                child: overlay,
              ),
          ],
        ),
      ),
    );
  }
}

// Compatibilidad temporal
typedef ImageWithOverlay = Pragma4ImageWithOverlay;