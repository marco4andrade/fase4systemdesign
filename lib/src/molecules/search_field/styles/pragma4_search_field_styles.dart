import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../theme/app_colors.dart';
import '../../../enums/enums.dart';

/// Helper de estilos para componentes de campo de búsqueda
class Pragma4SearchFieldStyles {
  Pragma4SearchFieldStyles._();

  /// Construye el icono de prefijo (búsqueda)
  static Widget buildSearchIcon() {
    return const Pragma4Icon(
      Icons.search,
      size: Pragma4ComponentSize.small,
      semanticColor: Pragma4Colors.onSurfaceVariant,
    );
  }

  /// Construye el botón de limpiar campo
  static Widget buildClearButton(VoidCallback onPressed) {
    return Pragma4IconButton(
      icon: Icons.clear,
      size: Pragma4ComponentSize.small,
      onPressed: onPressed,
    );
  }

  /// Obtiene las propiedades de input para búsqueda
  static TextInputType getKeyboardType() => TextInputType.text;
  
  static TextInputAction getTextInputAction() => TextInputAction.search;
}