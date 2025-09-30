import 'package:flutter/material.dart';
import '../organisms/organisms.dart';
import 'app_layout.dart';

/// Plantilla de formulario para pantallas de captura de datos
class Pragma4FormTemplate extends StatelessWidget {
  const Pragma4FormTemplate({
    super.key,
    required this.title,
    required this.formLayout,
    this.subtitle,
    this.showBackButton = true,
  });

  final String title;
  final String? subtitle;
  final Pragma4FormLayout formLayout;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Pragma4AppLayout(
      appBar: Pragma4AppHeader(
        title: title,
        subtitle: subtitle,
        showBackButton: showBackButton,
      ),
      body: SingleChildScrollView(
        child: formLayout,
      ),
    );
  }
}
