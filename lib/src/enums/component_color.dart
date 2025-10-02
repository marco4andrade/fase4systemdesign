/// Enum general para colores de componentes
/// Puede ser aplicado a textos, iconos, etc.
enum Pragma4ComponentColor {
  primary,
  secondary,
  success,
  warning,
  danger,
  info,
  neutral,
  muted,
  disabled,
  onPrimary,
  onSecondary,
  onSuccess,
  onWarning,
  onDanger,
  onInfo,
  onSurface,
  onBackground,
}

/// Extension para obtener categorías de colores
extension Pragma4ComponentColorExtension on Pragma4ComponentColor {
  /// Si es un color de texto válido
  bool get isTextColor {
    return [
      Pragma4ComponentColor.primary,
      Pragma4ComponentColor.secondary,
      Pragma4ComponentColor.success,
      Pragma4ComponentColor.warning,
      Pragma4ComponentColor.danger,
      Pragma4ComponentColor.info,
      Pragma4ComponentColor.neutral,
      Pragma4ComponentColor.muted,
      Pragma4ComponentColor.disabled,
      Pragma4ComponentColor.onSurface,
      Pragma4ComponentColor.onBackground,
    ].contains(this);
  }

  /// Si es un color de superficie
  bool get isSurfaceColor {
    return [
      Pragma4ComponentColor.primary,
      Pragma4ComponentColor.secondary,
      Pragma4ComponentColor.success,
      Pragma4ComponentColor.warning,
      Pragma4ComponentColor.danger,
      Pragma4ComponentColor.info,
      Pragma4ComponentColor.neutral,
    ].contains(this);
  }

  /// Si es un color "on" (para texto sobre superficie)
  bool get isOnColor {
    return [
      Pragma4ComponentColor.onPrimary,
      Pragma4ComponentColor.onSecondary,
      Pragma4ComponentColor.onSuccess,
      Pragma4ComponentColor.onWarning,
      Pragma4ComponentColor.onDanger,
      Pragma4ComponentColor.onInfo,
      Pragma4ComponentColor.onSurface,
      Pragma4ComponentColor.onBackground,
    ].contains(this);
  }
}