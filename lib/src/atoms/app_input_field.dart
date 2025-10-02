import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../enums/enums.dart';

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
          Text(widget.labelText!, style: _getLabelStyle()),
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
          style: _getTextStyle(),
          decoration: _getInputDecoration(),
        ),
        if (widget.helperText != null || widget.errorText != null) ...[
          const SizedBox(height: 4.0),
          Text(
            widget.errorText ?? widget.helperText ?? '',
            style: _getHelperStyle(),
          ),
        ],
      ],
    );
  }

  InputDecoration _getInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: _getHintStyle(),
      prefixIcon: widget.prefixIcon,
      suffixIcon: _buildSuffixIcon(),
      filled: widget.variant == Pragma4ComponentVariant.filled,
      fillColor: widget.variant == Pragma4ComponentVariant.filled
          ? Pragma4Colors.surfaceVariant
          : null,
      contentPadding: _getContentPadding(),
      border: _getBorder(),
      enabledBorder: _getBorder(),
      focusedBorder: _getFocusedBorder(),
      errorBorder: _getErrorBorder(),
      focusedErrorBorder: _getErrorBorder(),
      disabledBorder: _getDisabledBorder(),
      errorText: null,
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          size: _getIconSize(),
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }
    return widget.suffixIcon;
  }

  EdgeInsets _getContentPadding() {
    return EdgeInsets.symmetric(
      horizontal: widget.size.buttonPadding,
      vertical: widget.size.buttonPadding / 2,
    );
  }

  InputBorder _getBorder() {
    switch (widget.variant) {
      case Pragma4ComponentVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(color: Pragma4Colors.grey300),
        );
      case Pragma4ComponentVariant.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: BorderSide.none,
        );
      case Pragma4ComponentVariant.underlined:
        return const UnderlineInputBorder(
          borderSide: BorderSide(color: Pragma4Colors.grey300),
        );
      default:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(color: Pragma4Colors.grey300),
        );
    }
  }

  InputBorder _getFocusedBorder() {
    switch (widget.variant) {
      case Pragma4ComponentVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(color: Pragma4Colors.primary, width: 2),
        );
      case Pragma4ComponentVariant.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(color: Pragma4Colors.primary, width: 2),
        );
      case Pragma4ComponentVariant.underlined:
        return const UnderlineInputBorder(
          borderSide: BorderSide(color: Pragma4Colors.primary, width: 2),
        );
      default:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(color: Pragma4Colors.primary, width: 2),
        );
    }
  }

  InputBorder _getErrorBorder() {
    switch (widget.variant) {
      case Pragma4ComponentVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(color: Pragma4Colors.error),
        );
      case Pragma4ComponentVariant.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(color: Pragma4Colors.error),
        );
      case Pragma4ComponentVariant.underlined:
        return const UnderlineInputBorder(
          borderSide: BorderSide(color: Pragma4Colors.error),
        );
      default:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(color: Pragma4Colors.error),
        );
    }
  }

  InputBorder _getDisabledBorder() {
    switch (widget.variant) {
      case Pragma4ComponentVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(color: Pragma4Colors.grey200),
        );
      case Pragma4ComponentVariant.filled:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: BorderSide.none,
        );
      case Pragma4ComponentVariant.underlined:
        return const UnderlineInputBorder(
          borderSide: BorderSide(color: Pragma4Colors.grey200),
        );
      default:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(_getBorderRadius()),
          borderSide: const BorderSide(color: Pragma4Colors.grey200),
        );
    }
  }

  double _getBorderRadius() {
    switch (widget.size) {
      case Pragma4ComponentSize.small:
        return 4.0;
      case Pragma4ComponentSize.medium:
        return 8.0;
      case Pragma4ComponentSize.large:
        return 12.0;
      case Pragma4ComponentSize.xlarge:
        return 16.0;
    }
  }

  TextStyle _getTextStyle() {
    switch (widget.size) {
      case Pragma4ComponentSize.small:
        return Pragma4Typography.bodySmall;
      case Pragma4ComponentSize.medium:
        return Pragma4Typography.bodyMedium;
      case Pragma4ComponentSize.large:
        return Pragma4Typography.bodyLarge;
      case Pragma4ComponentSize.xlarge:
        return Pragma4Typography.bodyLarge;
    }
  }

  TextStyle _getLabelStyle() {
    return Pragma4Typography.labelMedium.copyWith(
      color: Pragma4Colors.onSurface,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle _getHintStyle() {
    return _getTextStyle().copyWith(color: Pragma4Colors.onSurfaceVariant);
  }

  TextStyle _getHelperStyle() {
    return Pragma4Typography.bodySmall.copyWith(
      color: widget.errorText != null
          ? Pragma4Colors.error
          : Pragma4Colors.onSurfaceVariant,
    );
  }

  double _getIconSize() {
    return widget.size.iconSize;
  }
}
