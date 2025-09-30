import 'package:fase4_system_design/fase4_system_design.dart';
import 'package:flutter/material.dart';

import 'atoms_page.dart';
import 'molecules_page.dart';
import 'organisms_page.dart';
import 'templates_page.dart';
import 'design_pages_page.dart';

/// Showcase principal que muestra las secciones del paquete
class ShowcasePage extends StatefulWidget {
  const ShowcasePage({Key? key}) : super(key: key);

  @override
  State<ShowcasePage> createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> {
  int _currentIndex = 0;

  final List<ShowcaseSection> _sections = const [
    ShowcaseSection(
      title: 'Resumen',
      icon: Icons.dashboard,
      page: OverviewPage(),
    ),
    ShowcaseSection(title: 'Átomos', icon: Icons.settings, page: AtomsPage()),
    ShowcaseSection(
      title: 'Moléculas',
      icon: Icons.category,
      page: MoleculesPage(),
    ),
    ShowcaseSection(
      title: 'Organismos',
      icon: Icons.widgets,
      page: OrganismsPage(),
    ),
    ShowcaseSection(
      title: 'Plantillas',
      icon: Icons.view_module,
      page: TemplatesPage(),
    ),
    ShowcaseSection(title: 'Páginas', icon: Icons.web, page: DesignPagesPage()),
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
                    size: Pragma4IconSize.large,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  Pragma4Text(
                    'Sistema de Diseño',
                    variant: Pragma4TextVariant.headlineMedium,
                    color: Colors.white,
                  ),
                  Pragma4Text(
                    'Componentes de Atomic Design',
                    variant: Pragma4TextVariant.bodyMedium,
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

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Pragma4Text(
            'Bienvenido al Sistema de Diseño',
            variant: Pragma4TextVariant.displayMedium,
          ),
          const SizedBox(height: 16),
          Pragma4Text(
            'Esta muestra demuestra un sistema de diseño completo construido usando principios de Atomic Design.',
            variant: Pragma4TextVariant.bodyLarge,
          ),
          const SizedBox(height: 32),
          Pragma4DashboardStats(
            stats: [
              Pragma4StatCard(
                title: 'Átomos',
                value: '10+',
                subtitle: 'Componentes básicos',
                icon: Icons.settings,
              ),
              Pragma4StatCard(
                title: 'Moléculas',
                value: '8+',
                subtitle: 'Componentes combinados',
                icon: Icons.category,
              ),
              Pragma4StatCard(
                title: 'Organismos',
                value: '6+',
                subtitle: 'Secciones complejas',
                icon: Icons.widgets,
              ),
              Pragma4StatCard(
                title: 'Plantillas',
                value: '4+',
                subtitle: 'Diseños de página',
                icon: Icons.view_module,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Pragma4Text(
            'Niveles de Atomic Design',
            variant: Pragma4TextVariant.headlineLarge,
          ),
          const SizedBox(height: 16),
          _buildDesignLevelCard(
            'Átomos',
            'Bloques de construcción básicos como botones, campos de entrada y texto',
            Icons.settings,
            colorScheme.primary,
          ),
          _buildDesignLevelCard(
            'Moléculas',
            'Combinaciones simples de átomos trabajando juntos',
            Icons.category,
            colorScheme.secondary,
          ),
          _buildDesignLevelCard(
            'Organismos',
            'Componentes de UI complejos construidos a partir de moléculas y átomos',
            Icons.widgets,
            colorScheme.secondary,
          ),
          _buildDesignLevelCard(
            'Plantillas',
            'Diseños de página que proporcionan estructura para el contenido',
            Icons.view_module,
            colorScheme.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildDesignLevelCard(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Pragma4CardComponent(
        leading: Pragma4Icon(icon, color: color, size: Pragma4IconSize.large),
        title: title,
        subtitle: description,
      ),
    );
  }
}

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
