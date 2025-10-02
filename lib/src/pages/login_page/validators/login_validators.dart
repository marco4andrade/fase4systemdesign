/// Validadores para el formulario de login
class LoginValidators {
  LoginValidators._();

  /// Validador de email
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu correo';
    }
    
    // Expresión regular para validar email
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Ingresa un correo válido';
    }
    
    return null;
  }

  /// Validador de contraseña
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu contraseña';
    }
    
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    
    return null;
  }

  /// Validador genérico para campos requeridos
  static String? requiredValidator(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa ${fieldName ?? 'este campo'}';
    }
    return null;
  }

  /// Validador de longitud mínima
  static String? minLengthValidator(String? value, int minLength, [String? fieldName]) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa ${fieldName ?? 'este campo'}';
    }
    
    if (value.length < minLength) {
      return '${fieldName ?? 'Este campo'} debe tener al menos $minLength caracteres';
    }
    
    return null;
  }
}