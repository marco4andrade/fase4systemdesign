import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../enums/enums.dart';
import '../styles/pragma4_user_profile_styles.dart';

/// Sección de biografía del perfil de usuario
class Pragma4UserProfileBio extends StatelessWidget {
  const Pragma4UserProfileBio({
    super.key,
    required this.bio,
    this.textVariant = Pragma4TextType.bodyMedium,
  });

  final String bio;
  final Pragma4TextType textVariant;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Pragma4UserProfileStyles.bioSpacing),
        Pragma4Text(
          bio,
          variant: textVariant,
        ),
      ],
    );
  }
}