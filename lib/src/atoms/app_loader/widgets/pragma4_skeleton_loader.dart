import 'package:flutter/material.dart';
import '../styles/pragma4_loader_styles.dart';

/// Cargador esqueleto para marcadores de posición de contenido
class Pragma4SkeletonLoader extends StatefulWidget {
  const Pragma4SkeletonLoader({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  final double width;
  final double height;
  final double? borderRadius;

  @override
  State<Pragma4SkeletonLoader> createState() => _Pragma4SkeletonLoaderState();
}

class _Pragma4SkeletonLoaderState extends State<Pragma4SkeletonLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Pragma4LoaderStyles.getSkeletonAnimationDuration(),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: -1.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    ));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = widget.borderRadius ?? 
        Pragma4LoaderStyles.getDefaultSkeletonBorderRadius();

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Pragma4LoaderStyles.getSkeletonBaseColor(),
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
      ),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(effectiveBorderRadius),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: Pragma4LoaderStyles.getSkeletonGradientColors(),
                stops: Pragma4LoaderStyles.getSkeletonGradientStops(_animation.value),
              ),
            ),
          );
        },
      ),
    );
  }
}