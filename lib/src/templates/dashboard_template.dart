import 'package:flutter/material.dart';
import '../organisms/organisms.dart';
import 'app_layout.dart';

/// Plantilla de dashboard con métricas y áreas de contenido
class Pragma4DashboardTemplate extends StatelessWidget {
  const Pragma4DashboardTemplate({
    super.key,
    required this.title,
    this.stats,
    this.content,
    this.actions,
  });

  final String title;
  final Pragma4DashboardStats? stats;
  final Widget? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Pragma4AppLayout(
      appBar: Pragma4AppHeader(title: title, actions: actions),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (stats != null) ...[
              stats!,
              const SizedBox(height: 32.0),
            ],
            if (content != null) content!,
          ],
        ),
      ),
    );
  }
}
