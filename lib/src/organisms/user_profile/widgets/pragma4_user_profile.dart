import 'package:flutter/material.dart';
import '../../../molecules/molecules.dart';
import '../../../enums/enums.dart';
import '../models/pragma4_user_profile_data.dart';
import '../styles/pragma4_user_profile_styles.dart';
import 'pragma4_user_profile_header.dart';
import 'pragma4_user_profile_bio.dart';
import 'pragma4_user_profile_actions.dart';

/// Organismo de perfil de usuario modularizado
class Pragma4UserProfile extends StatelessWidget {
  const Pragma4UserProfile({
    super.key,
    required this.user,
    this.onEdit,
    this.onMessage,
    this.showActions = true,
    this.avatarSize = Pragma4ComponentSize.large,
    this.editButtonText = 'Editar perfil',
    this.messageButtonText = 'Mensaje',
  });

  final Pragma4UserProfileData user;
  final VoidCallback? onEdit;
  final VoidCallback? onMessage;
  final bool showActions;
  final Pragma4ComponentSize avatarSize;
  final String editButtonText;
  final String messageButtonText;

  @override
  Widget build(BuildContext context) {
    return Pragma4CardComponent(
      padding: Pragma4UserProfileStyles.mainPadding,
      content: Column(
        children: [
          // Header con avatar e información
          Pragma4UserProfileHeader(
            user: user,
            avatarSize: avatarSize,
          ),
          
          // Biografía (si existe)
          if (user.hasBio)
            Pragma4UserProfileBio(bio: user.bio!),
          
          // Acciones (si están habilitadas y hay callbacks)
          if (showActions && _hasActions())
            Pragma4UserProfileActions(
              onEdit: onEdit,
              onMessage: onMessage,
              editButtonText: editButtonText,
              messageButtonText: messageButtonText,
            ),
        ],
      ),
    );
  }

  bool _hasActions() => onEdit != null || onMessage != null;
}