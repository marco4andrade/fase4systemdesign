import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../theme/app_colors.dart';
import '../../../enums/enums.dart';
import '../models/login_form_data.dart';
import '../styles/login_page_styles.dart';

/// Opciones del formulario: Remember Me y Forgot Password
class LoginFormOptions extends StatelessWidget {
  const LoginFormOptions({
    super.key,
    required this.formData,
    required this.onRememberMeChanged,
    required this.showRememberMe,
    this.onForgotPassword,
  });

  final LoginFormData formData;
  final ValueChanged<bool> onRememberMeChanged;
  final bool showRememberMe;
  final VoidCallback? onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: LoginPageStyles.spaceBetweenAlignment,
      children: [
        // Sección "Recordarme"
        if (showRememberMe)
          Row(
            mainAxisSize: LoginPageStyles.minButtonSize,
            children: [
              Pragma4Switch(
                value: formData.rememberMe,
                onChanged: onRememberMeChanged,
              ),
              const SizedBox(width: LoginPageStyles.rememberMeSpacing),
              const Pragma4Text('Recordarme', variant: Pragma4TextType.bodyMedium),
            ],
          )
        else
          const SizedBox.shrink(),

        // Enlace "¿Olvidaste tu contraseña?"
        TextButton(
          onPressed: onForgotPassword,
          child: const Pragma4Text(
            '¿Olvidaste tu contraseña?',
            variant: Pragma4TextType.bodyMedium,
            color: Pragma4Colors.primary,
          ),
        ),
      ],
    );
  }
}