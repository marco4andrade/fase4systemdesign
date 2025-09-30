import 'package:flutter/material.dart';
import '../molecules/molecules.dart';

/// Form layout organism
class Pragma4FormLayout extends StatelessWidget {
  const Pragma4FormLayout({
    super.key,
    required this.groups,
    this.actions,
    this.spacing = 24.0,
  });

  final List<Pragma4FormGroup> groups;
  final List<Widget>? actions;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...groups.expand(
          (group) => [
            group,
            if (group != groups.last) SizedBox(height: spacing),
          ],
        ),
        if (actions != null && actions!.isNotEmpty) ...[
          SizedBox(height: spacing * 1.5),
          Pragma4ButtonGroup(
            buttons: actions!,
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ],
      ],
    );
  }
}
