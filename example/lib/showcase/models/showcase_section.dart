import 'package:flutter/material.dart';

/// Modelo que representa una sección dentro del showcase.
class ShowcaseSection {
  const ShowcaseSection({
    required this.title,
    required this.icon,
    required this.page,
  });

  final String title;
  final IconData icon;
  final Widget page;
}
