import 'package:flutter/material.dart';
import '../theme/app_typography.dart';
import '../theme/app_colors.dart';
import '../enums/enums.dart';

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
      case Pragma4TextType.displayLarge:
        return Pragma4Typography.displayLarge;
      case Pragma4TextType.displayMedium:
        return Pragma4Typography.displayMedium;
      case Pragma4TextType.displaySmall:
        return Pragma4Typography.displaySmall;
      case Pragma4TextType.headlineLarge:
        return Pragma4Typography.headlineLarge;
      case Pragma4TextType.headlineMedium:
        return Pragma4Typography.headlineMedium;
      case Pragma4TextType.headlineSmall:
        return Pragma4Typography.headlineSmall;
      case Pragma4TextType.titleLarge:
        return Pragma4Typography.headlineLarge; // Usar headlineLarge como título grande
      case Pragma4TextType.titleMedium:
        return Pragma4Typography.headlineMedium; // Usar headlineMedium como título medio
      case Pragma4TextType.titleSmall:
        return Pragma4Typography.headlineSmall; // Usar headlineSmall como título pequeño
      case Pragma4TextType.bodyLarge:
        return Pragma4Typography.bodyLarge;
      case Pragma4TextType.bodyMedium:
        return Pragma4Typography.bodyMedium;
      case Pragma4TextType.bodySmall:
        return Pragma4Typography.bodySmall;
      case Pragma4TextType.labelLarge:
        return Pragma4Typography.labelLarge;
      case Pragma4TextType.labelMedium:
        return Pragma4Typography.labelMedium;
      case Pragma4TextType.labelSmall:
        return Pragma4Typography.labelSmall;
    }
  }

  Color _getSemanticColor() {
    switch (semanticColor!) {
      case Pragma4ComponentColor.primary:
        return Pragma4Colors.primary;
      case Pragma4ComponentColor.secondary:
        return Pragma4Colors.secondary;
      case Pragma4ComponentColor.neutral:
        return Pragma4Colors.onSurfaceVariant;
      case Pragma4ComponentColor.success:
        return Pragma4Colors.success;
      case Pragma4ComponentColor.warning:
        return Pragma4Colors.warning;
      case Pragma4ComponentColor.danger:
        return Pragma4Colors.error;
      case Pragma4ComponentColor.info:
        return Pragma4Colors.info;
      case Pragma4ComponentColor.muted:
        return Pragma4Colors.onSurfaceVariant.withValues(alpha: 0.6);
      case Pragma4ComponentColor.disabled:
        return Pragma4Colors.onSurfaceVariant.withValues(alpha: 0.4);
      default:
        return Pragma4Colors.primary;
    }
  }
}

/// Texto de display para encabezados y contenido importante
class Pragma4DisplayText extends Pragma4Text {
  const Pragma4DisplayText(
    super.text, {
    super.key,
    super.variant = Pragma4TextType.displayMedium,
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
    super.variant = Pragma4TextType.headlineMedium,
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
    super.variant = Pragma4TextType.bodyMedium,
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
    super.variant = Pragma4TextType.labelMedium,
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
  }) : super(variant: Pragma4TextType.labelSmall);
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
  }) : super(variant: Pragma4TextType.bodySmall);
}
