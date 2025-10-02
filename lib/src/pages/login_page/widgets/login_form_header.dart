import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../enums/enums.dart';
import '../../../theme/app_colors.dart';
import '../styles/login_page_styles.dart';

/// Header del formulario de login con logo, título y subtítulo
class LoginFormHeader extends StatelessWidget {
  const LoginFormHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.logoWidget,
  });

  final String title;
  final String subtitle;
  final Widget? logoWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo superior
        if (logoWidget != null) ...[
          Center(child: logoWidget!),
          const SizedBox(height: LoginPageStyles.logoSpacing),
        ],

        // Título
        Pragma4HeadlineText(
          title,
          variant: Pragma4TextType.headlineLarge,
          textAlign: LoginPageStyles.centerTextAlign,
        ),
        
        const SizedBox(height: LoginPageStyles.titleSpacing),
        
        // Subtítulo
        Pragma4BodyText(
          subtitle,
          variant: Pragma4TextType.bodyLarge,
          textAlign: LoginPageStyles.centerTextAlign,
          color: Pragma4Colors.onSurfaceVariant,
        ),
      ],
    );
  }
}