import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';
import '../models/showcase_section.dart';
import '../../pages/atoms_page.dart';
import '../../pages/molecules_page.dart';
import '../../pages/organisms_page.dart';
import '../../pages/templates_page.dart';
import '../../pages/design_pages_page.dart';
import 'overview_page.dart';

/// Nueva versión de la página principal del showcase con modelo separado.
class ShowcasePage extends StatefulWidget {
  const ShowcasePage({super.key});

  @override
  State<ShowcasePage> createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> {
  int _currentIndex = 0;

  late final List<ShowcaseSection> _sections = [
    const ShowcaseSection(
      title: 'Resumen',
      icon: Icons.dashboard,
      page: OverviewPage(),
    ),
    const ShowcaseSection(
      title: 'Átomos',
      icon: Icons.settings,
      page: AtomsPage(),
    ),
    const ShowcaseSection(
      title: 'Moléculas',
      icon: Icons.category,
      page: MoleculesPage(),
    ),
    const ShowcaseSection(
      title: 'Organismos',
      icon: Icons.widgets,
      page: OrganismsPage(),
    ),
    const ShowcaseSection(
      title: 'Plantillas',
      icon: Icons.view_module,
      page: TemplatesPage(),
    ),
    const ShowcaseSection(
      title: 'Páginas',
      icon: Icons.web,
      page: DesignPagesPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Pragma4AppLayout(
      appBar: const Pragma4AppHeader(
        title: 'Muestra del Sistema de Diseño',
        subtitle: 'Demostración de Atomic Design',
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary,
                    colorScheme.primary.withOpacity(0.85),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Pragma4Icon(
                    Icons.palette,
                    size: Pragma4ComponentSize.large,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  const Pragma4Text(
                    'Sistema de Diseño',
                    variant: Pragma4TextType.headlineMedium,
                    color: Colors.white,
                  ),
                  const Pragma4Text(
                    'Componentes de Atomic Design',
                    variant: Pragma4TextType.bodyMedium,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _sections.length,
                itemBuilder: (context, index) {
                  final section = _sections[index];
                  return ListTile(
                    leading: Icon(section.icon, color: colorScheme.onSurface),
                    title: Text(
                      section.title,
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                    selected: index == _currentIndex,
                    onTap: () {
                      setState(() => _currentIndex = index);
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: _sections[_currentIndex].page,
    );
  }
}
