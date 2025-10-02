import 'package:flutter/material.dart';
import '../../../enums/enums.dart';
import '../styles/pragma4_text_styles.dart';

/// Componente de texto atómico con tipografía consistente
class Pragma4Text extends StatelessWidget {
  const Pragma4Text(
    this.text, {
    super.key,
    this.variant = Pragma4TextType.bodyMedium,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.letterSpacing,
    this.height,
    this.decoration,
    this.semanticColor,
  });

  final String text;
  final Pragma4TextType variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? letterSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Pragma4ComponentColor? semanticColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Pragma4TextStyles.buildTextStyle(
        variant: variant,
        color: color,
        semanticColor: semanticColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}