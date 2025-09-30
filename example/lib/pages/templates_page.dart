import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart' as design;

/// Página de showcase para Plantillas (Templates)
class TemplatesPage extends StatelessWidget {
  const TemplatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const design.Pragma4Text(
            'Plantillas',
            variant: design.Pragma4TextVariant.displayMedium,
          ),
          const SizedBox(height: 16),
          const design.Pragma4Text(
            'Estructuras de página reutilizables que definen layout y composición.',
            variant: design.Pragma4TextVariant.bodyLarge,
          ),
          const SizedBox(height: 32),
          _buildTemplateSection(
            title: 'AppLayout',
            description:
                'Layout base con appBar, drawer, body y zonas configurables.',
            child: SizedBox(
              height: 220,
              child: design.Pragma4AppLayout(
                appBar: const design.Pragma4AppHeader(title: 'Título'),
                body: const Center(
                  child: design.Pragma4BodyText('Contenido principal'),
                ),
              ),
            ),
          ),
          _buildTemplateSection(
            title: 'DashboardTemplate',
            description: 'Plantilla para tableros con métricas y contenido.',
            child: SizedBox(
              height: 260,
              child: design.Pragma4DashboardTemplate(
                title: 'Panel de Ventas',
                actions: [
                  design.Pragma4Button(
                    variant: design.Pragma4ButtonVariant.secondary,
                    text: 'Acción',
                    onPressed: () {},
                  ),
                ],
                stats: design.Pragma4DashboardStats(
                  stats: [
                    design.Pragma4StatCard(
                      title: 'Ventas',
                      value: '\$1,200',
                      icon: Icons.attach_money,
                    ),
                    design.Pragma4StatCard(
                      title: 'Usuarios',
                      value: '340',
                      icon: Icons.people,
                    ),
                  ],
                ),
                content: const Padding(
                  padding: EdgeInsets.all(16),
                  child: design.Pragma4BodyText('Contenido del dashboard...'),
                ),
              ),
            ),
          ),
          _buildTemplateSection(
            title: 'FormTemplate',
            description: 'Estructura para páginas con formularios.',
            child: SizedBox(
              height: 260,
              child: design.Pragma4FormTemplate(
                title: 'Registro',
                subtitle: 'Crear nuevo usuario',
                formLayout: const design.Pragma4FormLayout(
                  groups: [
                    design.Pragma4FormGroup(
                      title: 'Datos Básicos',
                      children: [
                        design.Pragma4InputField(labelText: 'Nombre'),
                        design.Pragma4InputField(labelText: 'Correo'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildTemplateSection(
            title: 'ListTemplate',
            description: 'Composición para listas con búsqueda y filtros.',
            child: SizedBox(
              height: 260,
              child: design.Pragma4ListTemplate(
                title: 'Productos',
                searchField: const design.Pragma4SearchField(
                  hintText: 'Buscar productos',
                ),
                filters: const Wrap(
                  spacing: 8,
                  children: [
                    // Uso de AppChip con parámetro 'label'
                    design.Pragma4Chip(text: 'Todos'),
                    design.Pragma4Chip(text: 'Activos'),
                  ],
                ),
                items: ListView(
                  padding: const EdgeInsets.all(8),
                  children: const [
                    design.Pragma4ListItem(
                      title: 'Producto A',
                      subtitle: 'Código 123',
                    ),
                    design.Pragma4ListItem(
                      title: 'Producto B',
                      subtitle: 'Código 234',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTemplateSection({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: design.Pragma4CardComponent(
        title: title,
        subtitle: description,
        content: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(color: Colors.green, child: child),
        ),
      ),
    );
  }
}
