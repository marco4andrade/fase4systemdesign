import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../models/login_form_data.dart';
import '../validators/login_validators.dart';
import '../styles/login_page_styles.dart';

/// Campos del formulario de login (email y contraseña)
class LoginFormFields extends StatelessWidget {
  const LoginFormFields({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formData,
    required this.onPasswordVisibilityToggle,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final LoginFormData formData;
  final VoidCallback onPasswordVisibilityToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Campo de usuario o correo electrónico
        Pragma4InputField(
          controller: emailController,
          labelText: 'Usuario o correo',
          hintText: 'Ingresa tu usuario o correo',
          keyboardType: LoginPageStyles.emailKeyboardType,
          // Nueva validación flexible: permite username simple o email válido
          validator: LoginValidators.usernameOrEmailValidator,
        ),
        const SizedBox(height: LoginPageStyles.fieldSpacing),
        // Campo de contraseña
        Pragma4InputField(
          controller: passwordController,
          labelText: 'Contraseña',
          hintText: 'Ingresa tu contraseña',
          obscureText: formData.obscurePassword,
          suffixIcon: IconButton(
            icon: Icon(
              formData.obscurePassword
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: onPasswordVisibilityToggle,
          ),
          validator: LoginValidators.passwordValidator,
        ),
      ],
    );
  }
}