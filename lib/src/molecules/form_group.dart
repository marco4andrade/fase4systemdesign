import 'package:flutter/material.dart';
import '../atoms/atoms.dart';
import '../enums/enums.dart';

/// Molécula de grupo de formulario para organizar campos
class Pragma4FormGroup extends StatelessWidget {
  const Pragma4FormGroup({
    super.key,
    this.title,
    this.description,
    required this.children,
  this.spacing = 16.0,
  });

  final String? title;
  final String? description;
  final List<Widget> children;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Pragma4Text(
            title!,
            variant: Pragma4TextType.headlineSmall,
          ),
          if (description != null) ...[
            const SizedBox(height: 4.0),
            Pragma4Text(
              description!,
              variant: Pragma4TextType.bodyMedium,
              semanticColor: Pragma4ComponentColor.muted,
            ),
          ],
          SizedBox(height: spacing),
        ],
        ...children.expand((child) => [
          child,
          if (child != children.last) SizedBox(height: spacing),
        ]),
      ],
    );
  }
}
