import 'package:design_system_example/widgets/drawer_demo_section.dart';
import 'package:design_system_example/widgets/section_org_widget.dart';
import 'package:fase4_system_design/fase4_system_design.dart';
import 'package:flutter/material.dart';

/// Showcase organismos
class OrganismsPage extends StatelessWidget {
  const OrganismsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Pragma4Text(
            'Organismos',
            variant: Pragma4TextType.displayMedium,
          ),
          SizedBox(height: 16),
          Pragma4Text(
            'Componentes complejos construidos a partir de moléculas y átomos',
            variant: Pragma4TextType.bodyLarge,
          ),
          SizedBox(height: 32),
          SectionWidget(
            title: 'Estadísticas del Dashboard',
            children: [
              Pragma4DashboardStats(
                stats: [
                  Pragma4StatCard(
                    title: 'Ventas Totales',
                    value: '\$12,345',
                    subtitle: '+12% vs mes anterior',
                    trend: Pragma4StatTrend.up,
                    icon: Icons.trending_up,
                  ),
                  Pragma4StatCard(
                    title: 'Nuevos Usuarios',
                    value: '1,234',
                    subtitle: '+5% este mes',
                    trend: Pragma4StatTrend.up,
                    icon: Icons.people,
                  ),
                  Pragma4StatCard(
                    title: 'Ingresos',
                    value: '\$5,678',
                    subtitle: '-2% vs promedio',
                    trend: Pragma4StatTrend.down,
                    icon: Icons.attach_money,
                  ),
                  Pragma4StatCard(
                    title: 'Conversiones',
                    value: '89%',
                    subtitle: 'Sin cambios',
                    trend: Pragma4StatTrend.neutral,
                    icon: Icons.track_changes,
                  ),
                ],
              ),
            ],
          ),
          SectionWidget(
            title: 'Perfil de Usuario',
            children: [
              Pragma4UserProfile(
                user: Pragma4UserProfileData(
                  id: '1',
                  name: 'Juan Pérez',
                  avatarUrl: 'https://via.placeholder.com/150',
                  title: 'Desarrollador Senior',
                  email: 'juan.perez@ejemplo.com',
                  bio:
                      'Desarrollador apasionado con más de 5 años de experiencia en Flutter y desarrollo móvil.',
                ),
                onEdit: _noop,
                onMessage: _noop,
              ),
            ],
          ),
          SectionWidget(
            title: 'Sección de Comentarios',
            children: [
              Pragma4CommentSection(
                comments: [
                  CommentData(
                    id: '1',
                    authorName: 'María García',
                    authorAvatar: 'https://via.placeholder.com/150',
                    content: '¡Este es un gran sistema de diseño!',
                    timeAgo: 'hace 2 horas',
                  ),
                  CommentData(
                    id: '2',
                    authorName: 'Carlos López',
                    authorAvatar: 'https://via.placeholder.com/150',
                    content: 'Me encanta el enfoque de atomic design.',
                    timeAgo: 'hace 1 día',
                  ),
                ],
                onAddComment: _noopAddComment,
              ),
            ],
          ),
          const DrawerDemoSection(),
          SectionWidget(
            title: 'Tabla de Datos',
            children: [
              Pragma4DataTable(
                columns: const [
                  DataColumn(label: Pragma4Text('ID')),
                  DataColumn(label: Pragma4Text('Nombre')),
                  DataColumn(label: Pragma4Text('Precio')),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Pragma4Text('1')),
                      DataCell(Pragma4Text('Camiseta')),
                      DataCell(Pragma4Text('\$19.99')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Pragma4Text('2')),
                      DataCell(Pragma4Text('Pantalones')),
                      DataCell(Pragma4Text('\$39.99')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Pragma4Text('3')),
                      DataCell(Pragma4Text('Zapatillas')),
                      DataCell(Pragma4Text('\$59.99')),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Métodos estáticos para callbacks vacíos (usados en const constructors)
  static void _noop() {}
  static void _noopAddComment(String comment) {}

}

