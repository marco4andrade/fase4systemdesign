import 'package:flutter/material.dart';
import '../organisms/organisms.dart';
import '../molecules/molecules.dart';
import 'app_layout.dart';

/// Plantilla de lista para mostrar colecciones de elementos
class Pragma4ListTemplate extends StatelessWidget {
  const Pragma4ListTemplate({
    super.key,
    required this.title,
    required this.items,
    this.searchField,
    this.filters,
    this.floatingActionButton,
    this.emptyState,
  });

  final String title;
  final Widget items;
  final Pragma4SearchField? searchField;
  final Widget? filters;
  final Widget? floatingActionButton;
  final Widget? emptyState;

  @override
  Widget build(BuildContext context) {
    return Pragma4AppLayout(
      appBar: Pragma4AppHeader(title: title),
      floatingActionButton: floatingActionButton,
      body: Column(
        children: [
          if (searchField != null) ...[
            searchField!,
            const SizedBox(height: 16.0),
          ],
          if (filters != null) ...[
            filters!,
            const SizedBox(height: 16.0),
          ],
          Expanded(child: items),
        ],
      ),
    );
  }
}
