/// Variantes de componentes específicos del sistema de diseño

/// Variantes de mensaje de alerta
enum Pragma4AlertVariant { 
  info, 
  success, 
  warning, 
  error 
}

/// Trends para tarjetas estadísticas
enum Pragma4StatTrend { 
  up, 
  down, 
  neutral;
  
  /// Indica si el trend es positivo
  bool get isPositive => this == Pragma4StatTrend.up;
  
  /// Indica si el trend es negativo  
  bool get isNegative => this == Pragma4StatTrend.down;
  
  /// Indica si el trend es neutral
  bool get isNeutral => this == Pragma4StatTrend.neutral;
}