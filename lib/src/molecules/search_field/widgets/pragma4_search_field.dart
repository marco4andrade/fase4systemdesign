import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../styles/pragma4_search_field_styles.dart';

/// Molécula de campo de búsqueda que combina entrada y acción de buscar
class Pragma4SearchField extends StatefulWidget {
  const Pragma4SearchField({
    super.key,
    this.hintText = 'Search...',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.controller,
    this.enabled = true,
    this.autofocus = false,
    this.showClearButton = true,
  });

  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final TextEditingController? controller;
  final bool enabled;
  final bool autofocus;
  final bool showClearButton;

  @override
  State<Pragma4SearchField> createState() => _Pragma4SearchFieldState();
}

class _Pragma4SearchFieldState extends State<Pragma4SearchField> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_handleTextChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_handleTextChanged);
    }
    super.dispose();
  }

  void _handleTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
    widget.onChanged?.call(_controller.text);
  }

  void _handleClear() {
    _controller.clear();
    widget.onClear?.call();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return Pragma4InputField(
      controller: _controller,
      hintText: widget.hintText,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      onSubmitted: widget.onSubmitted,
      prefixIcon: Pragma4SearchFieldStyles.buildSearchIcon(),
      suffixIcon: widget.showClearButton && _hasText
          ? Pragma4SearchFieldStyles.buildClearButton(_handleClear)
          : null,
      keyboardType: Pragma4SearchFieldStyles.getKeyboardType(),
      textInputAction: Pragma4SearchFieldStyles.getTextInputAction(),
    );
  }
}