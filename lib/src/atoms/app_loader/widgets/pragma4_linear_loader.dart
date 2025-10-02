import 'package:flutter/material.dart';
import '../styles/pragma4_loader_styles.dart';

/// Cargador lineal de progreso
class Pragma4LinearLoader extends StatelessWidget {
  const Pragma4LinearLoader({
    super.key,
    this.value,
    this.color,
    this.backgroundColor,
    this.height,
    this.borderRadius,
  });

  final double? value;
  final Color? color;
  final Color? backgroundColor;
  final double? height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final effectiveHeight = height ?? Pragma4LoaderStyles.getDefaultLinearHeight();
    final effectiveBorderRadius = borderRadius ?? Pragma4LoaderStyles.getDefaultLinearBorderRadius();

    return ClipRRect(
      borderRadius: BorderRadius.circular(effectiveBorderRadius),
      child: SizedBox(
        height: effectiveHeight,
        child: LinearProgressIndicator(
          value: value,
          color: color ?? Pragma4LoaderStyles.getDefaultColor(),
          backgroundColor: backgroundColor ?? Pragma4LoaderStyles.getDefaultBackgroundColor(),
        ),
      ),
    );
  }
}