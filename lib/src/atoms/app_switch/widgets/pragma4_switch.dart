import 'package:flutter/material.dart';
import '../../../enums/enums.dart';
import '../styles/pragma4_switch_styles.dart';

/// Componente de interruptor atómico para valores booleanos
class Pragma4Switch extends StatelessWidget {
  const Pragma4Switch({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = Pragma4ComponentSize.medium,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.isDisabled = false,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Pragma4ComponentSize size;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: Pragma4SwitchStyles.getScale(size),
      child: Switch(
        value: value,
        onChanged: isDisabled ? null : onChanged,
        thumbColor: Pragma4SwitchStyles.getThumbColor(
          value: value,
          thumbColor: thumbColor,
        ),
        trackColor: Pragma4SwitchStyles.getTrackColor(
          value: value,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        ),
        trackOutlineColor: Pragma4SwitchStyles.getTrackOutlineColor(),
      ),
    );
  }
}