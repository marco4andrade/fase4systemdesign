/// Enum general para tamaños de componentes
/// Puede ser aplicado a botones, iconos, avatares, inputs, etc.
enum Pragma4ComponentSize {
  small,
  medium,
  large,
  xlarge,
}

/// Extension para obtener valores específicos de tamaño
extension Pragma4ComponentSizeExtension on Pragma4ComponentSize {
  /// Tamaño para iconos (en px)
  double get iconSize {
    switch (this) {
      case Pragma4ComponentSize.small:
        return 16.0;
      case Pragma4ComponentSize.medium:
        return 24.0;
      case Pragma4ComponentSize.large:
        return 32.0;
      case Pragma4ComponentSize.xlarge:
        return 48.0;
    }
  }

  /// Tamaño para avatares (en px)
  double get avatarSize {
    switch (this) {
      case Pragma4ComponentSize.small:
        return 32.0;
      case Pragma4ComponentSize.medium:
        return 48.0;
      case Pragma4ComponentSize.large:
        return 64.0;
      case Pragma4ComponentSize.xlarge:
        return 96.0;
    }
  }

  /// Padding para botones
  double get buttonPadding {
    switch (this) {
      case Pragma4ComponentSize.small:
        return 8.0;
      case Pragma4ComponentSize.medium:
        return 12.0;
      case Pragma4ComponentSize.large:
        return 16.0;
      case Pragma4ComponentSize.xlarge:
        return 20.0;
    }
  }

  /// Altura para inputs
  double get inputHeight {
    switch (this) {
      case Pragma4ComponentSize.small:
        return 36.0;
      case Pragma4ComponentSize.medium:
        return 44.0;
      case Pragma4ComponentSize.large:
        return 52.0;
      case Pragma4ComponentSize.xlarge:
        return 60.0;
    }
  }
}