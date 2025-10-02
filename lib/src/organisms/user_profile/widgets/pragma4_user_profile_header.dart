import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../enums/enums.dart';
import '../models/pragma4_user_profile_data.dart';
import '../styles/pragma4_user_profile_styles.dart';

/// Header del perfil de usuario con avatar e información básica
class Pragma4UserProfileHeader extends StatelessWidget {
  const Pragma4UserProfileHeader({
    super.key,
    required this.user,
    this.avatarSize = Pragma4ComponentSize.large,
  });

  final Pragma4UserProfileData user;
  final Pragma4ComponentSize avatarSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Pragma4Avatar(
          imageUrl: user.avatarUrl,
          initials: user.initials,
          size: avatarSize,
        ),
        const SizedBox(width: Pragma4UserProfileStyles.avatarInfoSpacing),
        Expanded(
          child: Column(
            crossAxisAlignment: Pragma4UserProfileStyles.infoAlignment,
            children: [
              Pragma4Text(
                user.name,
                variant: Pragma4TextType.headlineMedium,
              ),
              if (user.hasProfessionalInfo) ...[
                const SizedBox(height: Pragma4UserProfileStyles.infoSpacing),
                Pragma4Text(
                  user.title!,
                  variant: Pragma4TextType.bodyMedium,
                  semanticColor: Pragma4ComponentColor.muted,
                ),
              ],
              if (user.hasContactInfo) ...[
                const SizedBox(height: Pragma4UserProfileStyles.infoSpacing),
                Pragma4Text(
                  user.email!,
                  variant: Pragma4TextType.bodySmall,
                  semanticColor: Pragma4ComponentColor.muted,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}