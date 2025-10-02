import 'pragma4_filter_chip_widget.dart';

/// Chip de opción para selección única - alias semántico de FilterChip
class Pragma4ChoiceChip extends Pragma4FilterChipInternal {
  const Pragma4ChoiceChip({
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