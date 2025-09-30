import 'package:flutter/material.dart';
import '../theme/app_typography.dart';
import '../theme/app_colors.dart';

/// Variantes de texto para distintos casos de uso
enum Pragma4TextVariant {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
  caption,
  overline,
  code,
}

/// Colores semánticos de texto
enum Pragma4TextColor {
  primary,
  secondary,
  tertiary,
  success,
  warning,
  error,
  info,
}

/// Componente de texto atómico con tipografía consistente
class Pragma4Text extends StatelessWidget {
  const Pragma4Text(
    this.text, {
    super.key,
    this.variant = Pragma4TextVariant.bodyMedium,
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
  final Pragma4TextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? letterSpacing;
  final double? height;
  final TextDecoration? decoration;
  final Pragma4TextColor? semanticColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getTextStyle(context),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  TextStyle _getTextStyle(BuildContext context) {
    TextStyle baseStyle = _getBaseStyle();

    Color? finalColor = color;
    if (semanticColor != null) {
      finalColor = _getSemanticColor();
    }

    return baseStyle.copyWith(
      color: finalColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration,
    );
  }

  TextStyle _getBaseStyle() {
    switch (variant) {
      case Pragma4TextVariant.displayLarge:
        return Pragma4Typography.displayLarge;
      case Pragma4TextVariant.displayMedium:
        return Pragma4Typography.displayMedium;
      case Pragma4TextVariant.displaySmall:
        return Pragma4Typography.displaySmall;
      case Pragma4TextVariant.headlineLarge:
        return Pragma4Typography.headlineLarge;
      case Pragma4TextVariant.headlineMedium:
        return Pragma4Typography.headlineMedium;
      case Pragma4TextVariant.headlineSmall:
        return Pragma4Typography.headlineSmall;
      case Pragma4TextVariant.bodyLarge:
        return Pragma4Typography.bodyLarge;
      case Pragma4TextVariant.bodyMedium:
        return Pragma4Typography.bodyMedium;
      case Pragma4TextVariant.bodySmall:
        return Pragma4Typography.bodySmall;
      case Pragma4TextVariant.labelLarge:
        return Pragma4Typography.labelLarge;
      case Pragma4TextVariant.labelMedium:
        return Pragma4Typography.labelMedium;
      case Pragma4TextVariant.labelSmall:
        return Pragma4Typography.labelSmall;
      case Pragma4TextVariant.caption:
        return Pragma4Typography.caption;
      case Pragma4TextVariant.overline:
        return Pragma4Typography.overline;
      case Pragma4TextVariant.code:
        return Pragma4Typography.code;
    }
  }

  Color _getSemanticColor() {
    switch (semanticColor!) {
      case Pragma4TextColor.primary:
        return Pragma4Colors.primary;
      case Pragma4TextColor.secondary:
        return Pragma4Colors.secondary;
      case Pragma4TextColor.tertiary:
        return Pragma4Colors.onSurfaceVariant;
      case Pragma4TextColor.success:
        return Pragma4Colors.success;
      case Pragma4TextColor.warning:
        return Pragma4Colors.warning;
      case Pragma4TextColor.error:
        return Pragma4Colors.error;
      case Pragma4TextColor.info:
        return Pragma4Colors.info;
    }
  }
}

/// Texto de display para encabezados y contenido importante
class Pragma4DisplayText extends Pragma4Text {
  const Pragma4DisplayText(
    super.text, {
    super.key,
    super.variant = Pragma4TextVariant.displayMedium,
    super.color,
    super.textAlign,
    super.maxLines,
    super.overflow,
    super.semanticColor,
  });
}

/// Texto de titular para encabezados de sección
class Pragma4HeadlineText extends Pragma4Text {
  const Pragma4HeadlineText(
    super.text, {
    super.key,
    super.variant = Pragma4TextVariant.headlineMedium,
    super.color,
    super.textAlign,
    super.maxLines,
    super.overflow,
    super.semanticColor,
  });
}

/// Texto de cuerpo para contenido
class Pragma4BodyText extends Pragma4Text {
  const Pragma4BodyText(
    super.text, {
    super.key,
    super.variant = Pragma4TextVariant.bodyMedium,
    super.color,
    super.textAlign,
    super.maxLines,
    super.overflow,
    super.semanticColor,
  });
}

/// Texto de etiqueta para campos de formulario y elementos de la interfaz
class Pragma4LabelText extends Pragma4Text {
  const Pragma4LabelText(
    super.text, {
    super.key,
    super.variant = Pragma4TextVariant.labelMedium,
    super.color,
    super.textAlign,
    super.maxLines,
    super.overflow,
    super.semanticColor,
  });
}

/// Texto de leyenda para texto de ayuda y metadatos
class Pragma4CaptionText extends Pragma4Text {
  const Pragma4CaptionText(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.maxLines,
    super.overflow,
    super.semanticColor,
  }) : super(variant: Pragma4TextVariant.caption);
}

/// Texto de código para mostrar fragmentos
class Pragma4CodeText extends Pragma4Text {
  const Pragma4CodeText(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.maxLines,
    super.overflow,
    super.semanticColor,
  }) : super(variant: Pragma4TextVariant.code);
}
