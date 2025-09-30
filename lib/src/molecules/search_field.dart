import 'package:flutter/material.dart';
import '../atoms/atoms.dart';
import '../theme/app_colors.dart';

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
      prefixIcon: const Pragma4Icon(
        Icons.search,
        size: Pragma4IconSize.small,
        semanticColor: Pragma4Colors.onSurfaceVariant,
      ),
      suffixIcon: widget.showClearButton && _hasText
          ? Pragma4IconButton(
              icon: Icons.clear,
              size: Pragma4IconSize.small,
              onPressed: _handleClear,
            )
          : null,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
    );
  }
}
