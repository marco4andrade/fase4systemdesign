import 'package:flutter/material.dart';
import '../../enums/enums.dart';
import 'styles/pragma4_loader_styles.dart';

/// Componente cargador atómico para estados de carga
class Pragma4Loader extends StatelessWidget {
  const Pragma4Loader({
    super.key,
    this.size = Pragma4ComponentSize.medium,
    this.color,
    this.strokeWidth,
  });

  final Pragma4ComponentSize size;
  final Color? color;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    final loaderSize = Pragma4LoaderStyles.getLoaderSize(size);
    
    return SizedBox(
      width: loaderSize,
      height: loaderSize,
      child: CircularProgressIndicator(
        color: color ?? Pragma4LoaderStyles.getDefaultColor(),
        strokeWidth: strokeWidth ?? Pragma4LoaderStyles.getStrokeWidth(size),
      ),
    );
  }
}