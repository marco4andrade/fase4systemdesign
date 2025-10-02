import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../enums/enums.dart';
import 'styles/pragma4_input_field_styles.dart';
import 'widgets/pragma4_input_suffix_icon.dart';

/// Componente de campo de entrada atómico
class Pragma4InputField extends StatefulWidget {
  const Pragma4InputField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.variant = Pragma4ComponentVariant.outlined,
    this.size = Pragma4ComponentSize.medium,
    this.focusNode,
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Pragma4ComponentVariant variant;
  final Pragma4ComponentSize size;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  State<Pragma4InputField> createState() => _Pragma4InputFieldState();
}

class _Pragma4InputFieldState extends State<Pragma4InputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: Pragma4InputFieldStyles.getLabelStyle(),
          ),
          const SizedBox(height: 4.0),
        ],
        TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          obscureText: _obscureText,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          validator: widget.validator,
          style: Pragma4InputFieldStyles.getTextStyle(widget.size),
          decoration: _buildInputDecoration(),
        ),
        if (widget.helperText != null || widget.errorText != null) ...[
          const SizedBox(height: 4.0),
          Text(
            widget.errorText ?? widget.helperText ?? '',
            style: Pragma4InputFieldStyles.getHelperStyle(
              isError: widget.errorText != null,
            ),
          ),
        ],
      ],
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: Pragma4InputFieldStyles.getHintStyle(widget.size),
      prefixIcon: widget.prefixIcon,
      suffixIcon: _buildSuffixIcon(),
      filled: Pragma4InputFieldStyles.shouldFill(widget.variant),
      fillColor: Pragma4InputFieldStyles.getFillColor(widget.variant),
      contentPadding: Pragma4InputFieldStyles.getContentPadding(widget.size),
      border: Pragma4InputFieldStyles.getBorder(widget.variant, widget.size),
      enabledBorder: Pragma4InputFieldStyles.getBorder(widget.variant, widget.size),
      focusedBorder: Pragma4InputFieldStyles.getFocusedBorder(widget.variant, widget.size),
      errorBorder: Pragma4InputFieldStyles.getErrorBorder(widget.variant, widget.size),
      focusedErrorBorder: Pragma4InputFieldStyles.getErrorBorder(widget.variant, widget.size),
      disabledBorder: Pragma4InputFieldStyles.getDisabledBorder(widget.variant, widget.size),
      errorText: null,
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.obscureText) {
      return Pragma4InputSuffixIcon(
        obscureText: widget.obscureText,
        size: widget.size,
        suffixIcon: widget.suffixIcon,
        onVisibilityToggle: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }
    return widget.suffixIcon;
  }
}