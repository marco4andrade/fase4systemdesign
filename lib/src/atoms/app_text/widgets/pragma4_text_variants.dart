import '../../../enums/enums.dart';
import 'pragma4_text.dart';

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