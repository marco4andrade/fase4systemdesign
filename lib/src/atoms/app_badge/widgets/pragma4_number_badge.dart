import 'package:flutter/material.dart';
import '../../../enums/enums.dart';
import '../pragma4_badge.dart';

/// Insignia numérica para conteos
class Pragma4NumberBadge extends StatelessWidget {
  const Pragma4NumberBadge({
    super.key,
    required this.count,
    this.variant = Pragma4ComponentVariant.danger,
    this.maxCount = 99,
  });

  final int count;
  final Pragma4ComponentVariant variant;
  final int maxCount;

  @override
  Widget build(BuildContext context) {
    final displayText = count > maxCount ? '$maxCount+' : count.toString();

    return Pragma4Badge(
      text: displayText,
      variant: variant,
      size: Pragma4ComponentSize.small,
    );
  }
}