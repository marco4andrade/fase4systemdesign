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
        // Campo de correo electrónico
        Pragma4InputField(
          controller: emailController,
          labelText: 'Correo electrónico',
          hintText: 'Ingresa tu correo',
          keyboardType: LoginPageStyles.emailKeyboardType,
          validator: LoginValidators.emailValidator,
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