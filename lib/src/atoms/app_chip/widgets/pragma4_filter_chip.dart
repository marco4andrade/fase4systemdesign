import 'pragma4_filter_chip_widget.dart';

/// Chip de filtro para selecciones múltiples - alias semántico de FilterChip
class Pragma4FilterChip extends Pragma4FilterChipInternal {
  const Pragma4FilterChip({
    super.key,
    required super.label,
    required super.isSelected,
    required super.onSelected,
    super.avatar,
    super.variant,
    super.backgroundColor,
    super.selectedColor,
    super.labelColor,
  });
}