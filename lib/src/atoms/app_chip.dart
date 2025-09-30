import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Variantes de chip
enum Pragma4ChipVariant { filled, outlined, elevated }

/// Componente de chip atómico para etiquetas y selecciones
class Pragma4Chip extends StatelessWidget {
  const Pragma4Chip({
    super.key,
    String? label,
    String? text,
    this.avatar,
    this.onDeleted,
    this.onPressed,
    this.isSelected = false,
    this.variant = Pragma4ChipVariant.filled,
    this.backgroundColor,
    this.selectedColor,
    this.labelColor,
    this.deleteIconColor,
  }) : label = label ?? text ?? '';

  final String label;
  final Widget? avatar;
  final VoidCallback? onDeleted;
  final VoidCallback? onPressed;
  final bool isSelected;
  final Pragma4ChipVariant variant;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? labelColor;
  final Color? deleteIconColor;

  @override
  Widget build(BuildContext context) {
    if (onPressed != null) {
      return _buildFilterChip();
    } else if (onDeleted != null) {
      return _buildInputChip();
    } else {
      return _buildActionChip();
    }
  }

  Widget _buildFilterChip() {
    return FilterChip(
      label: Text(label, style: _getLabelStyle()),
      avatar: avatar,
      selected: isSelected,
      onSelected: (_) => onPressed?.call(),
      backgroundColor: _getBackgroundColor(),
      selectedColor: selectedColor ?? Pragma4Colors.primary,
      labelStyle: _getLabelStyle(),
      side: _getBorderSide(),
      elevation: _getElevation(),
      padding: _getPadding(),
      shape: _getShape(),
    );
  }

  Widget _buildInputChip() {
    return InputChip(
      label: Text(label, style: _getLabelStyle()),
      avatar: avatar,
      onDeleted: onDeleted,
      deleteIconColor: deleteIconColor ?? Pragma4Colors.onSurfaceVariant,
      backgroundColor: _getBackgroundColor(),
      labelStyle: _getLabelStyle(),
      side: _getBorderSide(),
      elevation: _getElevation(),
      padding: _getPadding(),
      shape: _getShape(),
    );
  }

  Widget _buildActionChip() {
    return ActionChip(
      label: Text(label, style: _getLabelStyle()),
      avatar: avatar,
      backgroundColor: _getBackgroundColor(),
      labelStyle: _getLabelStyle(),
      side: _getBorderSide(),
      elevation: _getElevation(),
      padding: _getPadding(),
      shape: _getShape(),
    );
  }

  Color _getBackgroundColor() {
    if (isSelected && selectedColor != null) {
      return selectedColor!;
    }

    if (backgroundColor != null) {
      return backgroundColor!;
    }

    switch (variant) {
      case Pragma4ChipVariant.filled:
        return Pragma4Colors.surfaceVariant;
      case Pragma4ChipVariant.outlined:
        return Colors.transparent;
      case Pragma4ChipVariant.elevated:
        return Pragma4Colors.surface;
    }
  }

  TextStyle _getLabelStyle() {
    return Pragma4Typography.labelMedium.copyWith(
      color: labelColor ?? _getLabelColor(),
    );
  }

  Color _getLabelColor() {
    if (isSelected) {
      return Pragma4Colors.onPrimary;
    }
    return Pragma4Colors.onSurface;
  }

  BorderSide? _getBorderSide() {
    switch (variant) {
      case Pragma4ChipVariant.outlined:
        return const BorderSide(color: Pragma4Colors.grey300);
      case Pragma4ChipVariant.filled:
      case Pragma4ChipVariant.elevated:
        return null;
    }
  }

  double _getElevation() {
    switch (variant) {
      case Pragma4ChipVariant.elevated:
        return 2;
      case Pragma4ChipVariant.filled:
      case Pragma4ChipVariant.outlined:
        return 0;
    }
  }

  EdgeInsets _getPadding() {
    return const EdgeInsets.symmetric(
      horizontal: 8.0, // sm
      vertical: 4.0, // xs
    );
  }

  OutlinedBorder _getShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0), // radiusRound
    );
  }
}

/// Chip de opción para selección única
class Pragma4ChoiceChip extends Pragma4Chip {
  const Pragma4ChoiceChip({
    super.key,
    required super.label,
    required super.isSelected,
    required super.onPressed,
    super.avatar,
    super.variant,
    super.backgroundColor,
    super.selectedColor,
    super.labelColor,
  });
}

/// Chip de filtro para selecciones múltiples
class Pragma4FilterChip extends Pragma4Chip {
  const Pragma4FilterChip({
    super.key,
    required super.label,
    required super.isSelected,
    required super.onPressed,
    super.avatar,
    super.variant,
    super.backgroundColor,
    super.selectedColor,
    super.labelColor,
  });
}
