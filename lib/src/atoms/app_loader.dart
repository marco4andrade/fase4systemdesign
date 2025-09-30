import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Tamaños del cargador
enum Pragma4LoaderSize {
  small, // 16 px
  medium, // 24 px
  large, // 32 px
  xlarge, // 48 px
}

/// Componente cargador atómico para estados de carga
class Pragma4Loader extends StatelessWidget {
  const Pragma4Loader({
    super.key,
    this.size = Pragma4LoaderSize.medium,
    this.color,
    this.strokeWidth,
  });

  final Pragma4LoaderSize size;
  final Color? color;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getSize(),
      height: _getSize(),
      child: CircularProgressIndicator(
        color: color ?? Pragma4Colors.primary,
        strokeWidth: strokeWidth ?? _getStrokeWidth(),
      ),
    );
  }

  double _getSize() {
    switch (size) {
      case Pragma4LoaderSize.small:
        return 16;
      case Pragma4LoaderSize.medium:
        return 24;
      case Pragma4LoaderSize.large:
        return 32;
      case Pragma4LoaderSize.xlarge:
        return 48;
    }
  }

  double _getStrokeWidth() {
    switch (size) {
      case Pragma4LoaderSize.small:
        return 2;
      case Pragma4LoaderSize.medium:
        return 2.5;
      case Pragma4LoaderSize.large:
        return 3;
      case Pragma4LoaderSize.xlarge:
        return 4;
    }
  }
}

/// Cargador lineal de progreso
class Pragma4LinearLoader extends StatelessWidget {
  const Pragma4LinearLoader({
    super.key,
    this.value,
    this.color,
    this.backgroundColor,
    this.height = 4,
    this.borderRadius = 2,
  });

  final double? value;
  final Color? color;
  final Color? backgroundColor;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: height,
        child: LinearProgressIndicator(
          value: value,
          color: color ?? Pragma4Colors.primary,
          backgroundColor: backgroundColor ?? Pragma4Colors.grey200,
        ),
      ),
    );
  }
}

/// Cargador esqueleto para marcadores de posición de contenido
class Pragma4SkeletonLoader extends StatefulWidget {
  const Pragma4SkeletonLoader({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 4,
  });

  final double width;
  final double height;
  final double borderRadius;

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
      duration: const Duration(milliseconds: 1500),
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
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Pragma4Colors.grey200,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: const [
                  Colors.transparent,
                  Pragma4Colors.grey100,
                  Colors.transparent,
                ],
                stops: [
                  _animation.value - 0.3,
                  _animation.value,
                  _animation.value + 0.3,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
