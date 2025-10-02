import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../models/login_form_data.dart';
import '../styles/login_page_styles.dart';
import 'login_form_header.dart';
import 'login_form_fields.dart';
import 'login_form_options.dart';
import 'login_form_actions.dart';

/// Página de login reutilizable y modularizada
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
  LoginFormData _formData = const LoginFormData();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateFormData(LoginFormData newData) {
    setState(() => _formData = newData);
  }

  void _handlePasswordVisibilityToggle() {
    _updateFormData(_formData.copyWith(
      obscurePassword: !_formData.obscurePassword,
    ));
  }

  void _handleRememberMeChanged(bool value) {
    _updateFormData(_formData.copyWith(rememberMe: value));
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      _updateFormData(_formData.copyWith(isLoading: true));
      
      widget.onLogin?.call(
        _emailController.text,
        _passwordController.text,
        _formData.rememberMe,
      );
      
      _updateFormData(_formData.copyWith(isLoading: false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? Pragma4Colors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(LoginPageStyles.mainPadding),
            child: ConstrainedBox(
              constraints: LoginPageStyles.formConstraints,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: LoginPageStyles.centerAlignment,
                  crossAxisAlignment: LoginPageStyles.stretchAlignment,
                  children: [
                    // Header con logo, título y subtítulo
                    LoginFormHeader(
                      title: widget.title,
                      subtitle: widget.subtitle,
                      logoWidget: widget.logoWidget,
                    ),
                    
                    const SizedBox(height: LoginPageStyles.sectionSpacing),
                    
                    // Campos del formulario
                    LoginFormFields(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      formData: _formData,
                      onPasswordVisibilityToggle: _handlePasswordVisibilityToggle,
                    ),
                    
                    const SizedBox(height: LoginPageStyles.fieldSpacing),
                    
                    // Opciones: Remember me y Forgot password
                    LoginFormOptions(
                      formData: _formData,
                      onRememberMeChanged: _handleRememberMeChanged,
                      showRememberMe: widget.showRememberMe,
                      onForgotPassword: widget.onForgotPassword,
                    ),
                    
                    const SizedBox(height: LoginPageStyles.sectionSpacing),
                    
                    // Acciones: Login button y Sign up
                    LoginFormActions(
                      formData: _formData,
                      onLogin: _handleLogin,
                      showSignUpOption: widget.showSignUpOption,
                      onSignUp: widget.onSignUp,
                    ),
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