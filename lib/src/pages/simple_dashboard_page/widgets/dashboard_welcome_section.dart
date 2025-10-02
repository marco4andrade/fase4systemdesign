import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../theme/app_colors.dart';
import '../../../enums/enums.dart';
import '../styles/dashboard_styles.dart';

/// Sección de bienvenida del dashboard
class DashboardWelcomeSection extends StatelessWidget {
  const DashboardWelcomeSection({
    super.key,
    this.welcomeTitle = 'Bienvenido',
    required this.subtitle,
    this.titleVariant = Pragma4TextType.headlineMedium,
    this.subtitleColor,
  });

  final String welcomeTitle;
  final String subtitle;
  final Pragma4TextType titleVariant;
  final Color? subtitleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: DashboardStyles.mainCrossAxisAlignment,
      children: [
        Pragma4HeadlineText(
          welcomeTitle,
          variant: titleVariant,
        ),
        const SizedBox(height: DashboardStyles.titleSpacing),
        Pragma4BodyText(
          subtitle,
          color: subtitleColor ?? Pragma4Colors.onSurfaceVariant,
        ),
      ],
    );
  }
}