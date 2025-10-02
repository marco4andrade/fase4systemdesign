/// Modelo de datos para el formulario de login
class LoginFormData {
  const LoginFormData({
    this.email = '',
    this.password = '',
    this.rememberMe = false,
    this.isLoading = false,
    this.obscurePassword = true,
  });

  final String email;
  final String password;
  final bool rememberMe;
  final bool isLoading;
  final bool obscurePassword;

  /// Crea una copia con valores actualizados
  LoginFormData copyWith({
    String? email,
    String? password,
    bool? rememberMe,
    bool? isLoading,
    bool? obscurePassword,
  }) {
    return LoginFormData(
      email: email ?? this.email,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      isLoading: isLoading ?? this.isLoading,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }

  /// Verifica si los datos son válidos para login
  bool get isValid => email.isNotEmpty && password.isNotEmpty;

  /// Verifica si el formulario está en estado de carga
  bool get canSubmit => isValid && !isLoading;
}