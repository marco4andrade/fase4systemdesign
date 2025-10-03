import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../theme/app_colors.dart';
import '../../../enums/enums.dart';
import '../styles/dashboard_styles.dart';

/// AppBar personalizado para el dashboard
class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    super.key,
    required this.title,
    this.onMenuTap,
    this.onNotificationTap,
    this.showMenuButton = true,
    this.showNotificationButton = true,
  });

  final String title;
  final VoidCallback? onMenuTap;
  final VoidCallback? onNotificationTap;
  final bool showMenuButton;
  final bool showNotificationButton;

  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.canPop(context);
    return AppBar(
      title: Pragma4Text(
        title,
        variant: Pragma4TextType.headlineSmall,
      ),
      backgroundColor: Pragma4Colors.surface,
      elevation: DashboardStyles.appBarElevation,
      leading: showMenuButton && onMenuTap != null
          ? IconButton(
              icon: Pragma4Icon(
                canPop ? Icons.arrow_back : Icons.menu,
              ),
              onPressed: onMenuTap,
            )
          : (canPop
              ? IconButton(
                  icon: const Pragma4Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                )
              : null),
      automaticallyImplyLeading: showMenuButton && onMenuTap != null,
      actions: [
        if (showNotificationButton && onNotificationTap != null)
          IconButton(
            icon: const Pragma4Icon(Icons.notifications_outlined),
            onPressed: onNotificationTap,
          ),
        const SizedBox(width: DashboardStyles.appBarRightSpacing),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}