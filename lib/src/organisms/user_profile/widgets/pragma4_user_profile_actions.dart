import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../molecules/molecules.dart';
import '../../../enums/enums.dart';
import '../styles/pragma4_user_profile_styles.dart';

/// Sección de acciones del perfil de usuario
class Pragma4UserProfileActions extends StatelessWidget {
  const Pragma4UserProfileActions({
    super.key,
    this.onEdit,
    this.onMessage,
    this.editButtonText = 'Editar perfil',
    this.messageButtonText = 'Mensaje',
    this.editButtonVariant = Pragma4ComponentVariant.outline,
    this.messageButtonVariant = Pragma4ComponentVariant.primary,
    this.spacing = 8.0,
  });

  final VoidCallback? onEdit;
  final VoidCallback? onMessage;
  final String editButtonText;
  final String messageButtonText;
  final Pragma4ComponentVariant editButtonVariant;
  final Pragma4ComponentVariant messageButtonVariant;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final List<Widget> actionButtons = [];

    if (onEdit != null) {
      actionButtons.add(
        Pragma4Button(
          text: editButtonText,
          onPressed: onEdit,
          variant: editButtonVariant,
        ),
      );
    }

    if (onMessage != null) {
      actionButtons.add(
        Pragma4Button(
          text: messageButtonText,
          onPressed: onMessage,
          variant: messageButtonVariant,
        ),
      );
    }

    if (actionButtons.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        const SizedBox(height: Pragma4UserProfileStyles.actionsSpacing),
        Pragma4ButtonGroup(
          buttons: actionButtons,
          spacing: spacing,
          mainAxisAlignment: Pragma4UserProfileStyles.actionsAlignment,
        ),
      ],
    );
  }
}