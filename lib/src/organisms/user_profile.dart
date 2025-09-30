import 'package:flutter/material.dart';
import '../atoms/atoms.dart';
import '../molecules/molecules.dart';

/// Organismo de perfil de usuario
class Pragma4UserProfile extends StatelessWidget {
  const Pragma4UserProfile({
    super.key,
    required this.user,
    this.onEdit,
    this.onMessage,
    this.showActions = true,
  });

  final Pragma4UserProfileData user;
  final VoidCallback? onEdit;
  final VoidCallback? onMessage;
  final bool showActions;

  @override
  Widget build(BuildContext context) {
    return Pragma4CardComponent(
      padding: const EdgeInsets.all(24.0),
      content: Column(
        children: [
          Row(
            children: [
              Pragma4Avatar(
                imageUrl: user.avatarUrl,
                initials: user.name.isNotEmpty ? user.name[0] : '?',
                size: Pragma4AvatarSize.large,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Pragma4Text(
                      user.name,
                      variant: Pragma4TextVariant.headlineMedium,
                    ),
                    if (user.title != null) ...[
                      const SizedBox(height: 4.0),
                      Pragma4Text(
                        user.title!,
                        variant: Pragma4TextVariant.bodyMedium,
                        semanticColor: Pragma4TextColor.tertiary,
                      ),
                    ],
                    if (user.email != null) ...[
                      const SizedBox(height: 4.0),
                      Pragma4Text(
                        user.email!,
                        variant: Pragma4TextVariant.bodySmall,
                        semanticColor: Pragma4TextColor.tertiary,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (user.bio != null) ...[
            const SizedBox(height: 16.0),
            Pragma4Text(user.bio!, variant: Pragma4TextVariant.bodyMedium),
          ],
          if (showActions && (onEdit != null || onMessage != null)) ...[
            const SizedBox(height: 24.0),
            Pragma4ButtonGroup(
              buttons: [
                if (onEdit != null)
                  Pragma4Button(
                    text: 'Editar perfil',
                    onPressed: onEdit,
                    variant: Pragma4ButtonVariant.outline,
                  ),
                if (onMessage != null)
                  Pragma4Button(text: 'Mensaje', onPressed: onMessage),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Datos del perfil de usuario
class Pragma4UserProfileData {
  const Pragma4UserProfileData({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.title,
    this.email,
    this.bio,
  });

  final String id;
  final String name;
  final String avatarUrl;
  final String? title;
  final String? email;
  final String? bio;
}
