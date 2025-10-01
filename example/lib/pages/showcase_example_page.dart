import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';
import '../routes/app_routes.dart';
import 'showcase_page.dart';

/// Página de ejemplo que muestra el showcase completo de componentes
class ShowcaseExamplePage extends StatelessWidget {
  const ShowcaseExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Pragma4Icon(Icons.arrow_back),
          onPressed: () => AppRoutes.goBack(context),
        ),
        title: const Pragma4HeadlineText(
          'Showcase del Sistema',
          variant: Pragma4TextVariant.headlineSmall,
        ),
        actions: [
          IconButton(
            icon: const Pragma4Icon(Icons.home),
            onPressed: () => AppRoutes.goToHome(context),
          ),
        ],
      ),
      body: const ShowcasePage(),
    );
  }
}