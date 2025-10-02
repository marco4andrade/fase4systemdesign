import 'package:flutter/material.dart';
import '../../../enums/enums.dart';
import '../styles/pragma4_input_field_styles.dart';

/// Widget para manejar el ícono de sufijo con toggle de visibilidad
class Pragma4InputSuffixIcon extends StatefulWidget {
  const Pragma4InputSuffixIcon({
    super.key,
    required this.obscureText,
    required this.size,
    this.suffixIcon,
    required this.onVisibilityToggle,
  });

  final bool obscureText;
  final Pragma4ComponentSize size;
  final Widget? suffixIcon;
  final VoidCallback onVisibilityToggle;

  @override
  State<Pragma4InputSuffixIcon> createState() => _Pragma4InputSuffixIconState();
}

class _Pragma4InputSuffixIconState extends State<Pragma4InputSuffixIcon> {
  late bool _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = !widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _isVisible ? Icons.visibility_off : Icons.visibility,
          size: Pragma4InputFieldStyles.getIconSize(widget.size),
        ),
        onPressed: () {
          setState(() {
            _isVisible = !_isVisible;
          });
          widget.onVisibilityToggle();
        },
      );
    }
    
    return widget.suffixIcon ?? const SizedBox.shrink();
  }
}