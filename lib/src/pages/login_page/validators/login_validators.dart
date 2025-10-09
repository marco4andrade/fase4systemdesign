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

  /// Nuevo: Valida que el campo sea un correo válido o un username.
  /// Reglas de username simples: 3-30 chars, letras, números, guion bajo o punto, no iniciar con punto.
  static String? usernameOrEmailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ingresa tu usuario o correo';
    }
    final input = value.trim();
    final emailRegex = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,}$');
    final usernameRegex = RegExp(r'^(?!\.)([A-Za-z0-9](?:[A-Za-z0-9_.]{1,28}[A-Za-z0-9])?)$');
    if (emailRegex.hasMatch(input) || usernameRegex.hasMatch(input)) {
      return null;
    }
    return 'Ingresa un usuario (letras, números, _ .) o un correo válido';
  }

  /// Validador específico de username (para formulario de registro)
  /// Reglas: 3-30 caracteres alfanuméricos, permite _ y ., no empieza con punto.
  static String? usernameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ingresa un nombre de usuario';
    }
    final input = value.trim();
    if (input.length < 3) return 'Mínimo 3 caracteres';
    if (input.length > 30) return 'Máximo 30 caracteres';
    final usernameRegex = RegExp(r'^(?!\.)([A-Za-z0-9](?:[A-Za-z0-9_.]{1,28}[A-Za-z0-9])?)$');
    if (!usernameRegex.hasMatch(input)) {
      return 'Solo letras, números, _ y . (no iniciar con .)';
    }
    return null;
  }
}