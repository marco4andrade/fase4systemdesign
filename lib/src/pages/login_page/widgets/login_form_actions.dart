import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../theme/app_colors.dart';
import '../../../enums/enums.dart';
import '../models/login_form_data.dart';
import '../styles/login_page_styles.dart';

/// Acciones del formulario: botón de login y opción de registro
class LoginFormActions extends StatelessWidget {
  const LoginFormActions({
    super.key,
    required this.formData,
    required this.onLogin,
    required this.showSignUpOption,
    this.onSignUp,
  });

  final LoginFormData formData;
  final VoidCallback onLogin;
  final bool showSignUpOption;
  final VoidCallback? onSignUp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: LoginPageStyles.stretchAlignment,
      children: [
        // Botón principal de login
        Pragma4Button(
          text: formData.isLoading ? 'Iniciando sesión...' : 'Iniciar Sesión',
          onPressed: formData.canSubmit ? onLogin : null,
          isLoading: formData.isLoading,
        ),

        // Opción de registro
        if (showSignUpOption) ...[
          const SizedBox(height: LoginPageStyles.actionSpacing),
          Row(
            mainAxisAlignment: LoginPageStyles.centerAlignment,
            children: [
              const Pragma4Text('¿No tienes cuenta? ', variant: Pragma4TextType.bodyMedium),
              TextButton(
                onPressed: onSignUp,
                child: const Pragma4Text(
                  'Regístrate',
                  variant: Pragma4TextType.bodyMedium,
                  color: Pragma4Colors.primary,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}