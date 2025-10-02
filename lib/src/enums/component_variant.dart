/// Enum general para variantes/tipos de componentes
/// Puede ser aplicado a botones, alertas, badges, chips, inputs, etc.
enum Pragma4ComponentVariant {
  primary,
  secondary,
  outline,
  ghost,
  danger,
  success,
  warning,
  info,
  filled,
  outlined,
  elevated,
  underlined,
}

/// Extension para identificar categorías de variantes
extension Pragma4ComponentVariantExtension on Pragma4ComponentVariant {
  /// Variantes para botones
  bool get isButtonVariant {
    return [
      Pragma4ComponentVariant.primary,
      Pragma4ComponentVariant.secondary,
      Pragma4ComponentVariant.outline,
      Pragma4ComponentVariant.ghost,
      Pragma4ComponentVariant.danger,
    ].contains(this);
  }

  /// Variantes para alertas
  bool get isAlertVariant {
    return [
      Pragma4ComponentVariant.info,
      Pragma4ComponentVariant.success,
      Pragma4ComponentVariant.warning,
      Pragma4ComponentVariant.danger,
    ].contains(this);
  }

  /// Variantes para chips
  bool get isChipVariant {
    return [
      Pragma4ComponentVariant.filled,
      Pragma4ComponentVariant.outlined,
      Pragma4ComponentVariant.elevated,
    ].contains(this);
  }

  /// Variantes para inputs
  bool get isInputVariant {
    return [
      Pragma4ComponentVariant.outlined,
      Pragma4ComponentVariant.filled,
      Pragma4ComponentVariant.underlined,
    ].contains(this);
  }

  /// Variantes para badges
  bool get isBadgeVariant {
    return [
      Pragma4ComponentVariant.primary,
      Pragma4ComponentVariant.secondary,
      Pragma4ComponentVariant.success,
      Pragma4ComponentVariant.warning,
      Pragma4ComponentVariant.danger,
      Pragma4ComponentVariant.info,
    ].contains(this);
  }
}