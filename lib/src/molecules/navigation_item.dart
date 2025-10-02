import 'package:flutter/material.dart';
import '../atoms/atoms.dart';
import '../theme/app_colors.dart';
import '../enums/enums.dart';
// app_spacing tokens replaced by concrete values in this file

/// Molécula de ítem de navegación para menús
class Pragma4NavigationItem extends StatelessWidget {
  const Pragma4NavigationItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.isSelected = false,
    this.badge,
    this.trailing,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isSelected;
  final Widget? badge;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? Pragma4Colors.primary.withValues(alpha: 0.1)
          : Colors.transparent,
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  Pragma4Icon(
                    icon,
                    color: isSelected ? Pragma4Colors.primary : null,
                  ),
                  if (badge != null)
                    Positioned(right: -4, top: -4, child: badge!),
                ],
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Pragma4Text(
                  label,
                  variant: Pragma4TextType.bodyLarge,
                  color: isSelected ? Pragma4Colors.primary : null,
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 8.0),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
