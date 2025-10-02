import 'package:flutter/material.dart';
import '../atoms/atoms.dart';
import '../theme/app_colors.dart';
import '../enums/enums.dart';

/// Página de login reutilizable
class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    this.onLogin,
    this.onForgotPassword,
    this.onSignUp,
    this.title = 'Iniciar Sesión',
    this.subtitle = 'Bienvenido de vuelta',
    this.showRememberMe = true,
    this.showSignUpOption = true,
    this.backgroundColor,
    this.logoWidget,
  });

  final void Function(String email, String password, bool rememberMe)? onLogin;
  final VoidCallback? onForgotPassword;
  final VoidCallback? onSignUp;
  final String title;
  final String subtitle;
  final bool showRememberMe;
  final bool showSignUpOption;
  final Color? backgroundColor;
  final Widget? logoWidget;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      widget.onLogin?.call(
        _emailController.text,
        _passwordController.text,
        _rememberMe,
      );
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? Pragma4Colors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo superior
                    if (widget.logoWidget != null) ...[
                      Center(child: widget.logoWidget!),
                      const SizedBox(height: 32.0),
                    ],

                    // Título y subtítulo
                    Pragma4HeadlineText(
                      widget.title,
                      variant: Pragma4TextType.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                    Pragma4BodyText(
                      widget.subtitle,
                      variant: Pragma4TextType.bodyLarge,
                      textAlign: TextAlign.center,
                      color: Pragma4Colors.onSurfaceVariant,
                    ),
                    const SizedBox(height: 32.0), // xl
                    // Campo de correo electrónico
                    Pragma4InputField(
                      controller: _emailController,
                      labelText: 'Correo electrónico',
                      hintText: 'Ingresa tu correo',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu correo';
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'Ingresa un correo válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    // Campo de contraseña
                    Pragma4InputField(
                      controller: _passwordController,
                      labelText: 'Contraseña',
                      hintText: 'Ingresa tu contraseña',
                      obscureText: _obscurePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu contraseña';
                        }
                        if (value.length < 6) {
                          return 'La contraseña debe tener al menos 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    // Recordarme y enlace de "Olvidé contraseña"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.showRememberMe)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Pragma4Switch(
                                value: _rememberMe,
                                onChanged: (value) =>
                                    setState(() => _rememberMe = value),
                              ),
                              const SizedBox(width: 8.0), // sm
                              const Pragma4BodyText('Recordarme'),
                            ],
                          )
                        else
                          const SizedBox.shrink(),
                        TextButton(
                          onPressed: widget.onForgotPassword,
                          child: const Pragma4BodyText(
                            '¿Olvidaste tu contraseña?',
                            color: Pragma4Colors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    // Botón principal de login
                    Pragma4Button(
                      text: _isLoading
                          ? 'Iniciando sesión...'
                          : 'Iniciar Sesión',
                      onPressed: _isLoading ? null : _handleLogin,
                      isLoading: _isLoading,
                    ),

                    // Opción secundaria: ir a registro
                    if (widget.showSignUpOption) ...[
                      const SizedBox(height: 24.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Pragma4BodyText('¿No tienes cuenta? '),
                          TextButton(
                            onPressed: widget.onSignUp,
                            child: const Pragma4BodyText(
                              'Regístrate',
                              color: Pragma4Colors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
