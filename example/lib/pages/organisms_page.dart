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
          const Pragma4Text(
            'Organismos',
            variant: Pragma4TextVariant.displayMedium,
          ),
          const SizedBox(height: 16),
          const Pragma4Text(
            'Componentes complejos construidos a partir de moléculas y átomos',
            variant: Pragma4TextVariant.bodyLarge,
          ),
          const SizedBox(height: 32),

          // Dashboard
          _buildSection('Estadísticas del Dashboard', [
            Pragma4DashboardStats(
              crossAxisCount: 2,
              stats: [
                Pragma4StatCard(
                  title: 'Ventas Totales',
                  value: '\$12,345',
                  trend: const Pragma4StatTrend(
                    percentage: '+12%',
                    isPositive: true,
                  ),
                  icon: Icons.trending_up,
                ),
                Pragma4StatCard(
                  title: 'Nuevos Usuarios',
                  value: '1,234',
                  trend: const Pragma4StatTrend(
                    percentage: '+5%',
                    isPositive: true,
                  ),
                  icon: Icons.people,
                ),
              ],
            ),
          ]),

          // Perfil
          _buildSection('Perfil de Usuario', [
            Pragma4UserProfile(
              user: const Pragma4UserProfileData(
                id: '1',
                name: 'Juan Pérez',
                avatarUrl: 'https://via.placeholder.com/150',
                title: 'Desarrollador Senior',
                email: 'juan.perez@ejemplo.com',
                bio:
                    'Desarrollador apasionado con más de 5 años de experiencia en Flutter y desarrollo móvil.',
              ),
              onEdit: () {},
              onMessage: () {},
            ),
          ]),

          // Comentarios
          _buildSection('Sección de Comentarios', [
            Pragma4CommentSection(
              comments: const [
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
              onAddComment: (comment) {},
            ),
          ]),

          // Drawer Demo
          _buildSection('Demo del Drawer', [
            ElevatedButton(
              onPressed: () => _openDrawerDemo(context),
              child: const Pragma4Text('Abrir Drawer Demo'),
            ),
          ]),

          // Tabla de Datos
          _buildSection('Tabla de Datos', [
            Pragma4DataTable(
              columns: const [
                DataColumn(label: Pragma4Text('ID')),
                DataColumn(label: Pragma4Text('Nombre')),
                DataColumn(label: Pragma4Text('Precio')),
              ],
              rows: [
                DataRow(cells: [
                  const DataCell(Pragma4Text('1')),
                  const DataCell(Pragma4Text('Camiseta')),
                  const DataCell(Pragma4Text('\$19.99')),
                ]),
                DataRow(cells: [
                  const DataCell(Pragma4Text('2')),
                  const DataCell(Pragma4Text('Pantalones')),
                  const DataCell(Pragma4Text('\$39.99')),
                ]),
                DataRow(cells: [
                  const DataCell(Pragma4Text('3')),
                  const DataCell(Pragma4Text('Zapatillas')),
                  const DataCell(Pragma4Text('\$59.99')),
                ]),
              ],
            ),
          ]),
        ],
      ),
    );
  }

  void _openDrawerDemo(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (ctx) => Scaffold(
          appBar: AppBar(title: const Pragma4Text('Demo Drawer')),
          drawer: Pragma4NavigationDrawer(
            header: DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(ctx).colorScheme.primary),
              child: const Pragma4Text('Usuario de Ejemplo', color: Colors.white),
            ),
            items: const [
              Pragma4NavigationDrawerItem(icon: Icons.home, label: 'Inicio'),
              Pragma4NavigationDrawerItem(icon: Icons.settings, label: 'Ajustes'),
              Pragma4NavigationDrawerItem(icon: Icons.info, label: 'Acerca'),
            ],
            onItemSelected: (index) {
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text('Seleccionado: $index')));
            },
          ),
          body: const Center(child: Pragma4Text('Abre el cajón desde la esquina superior izquierda')),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Pragma4Text(title, variant: Pragma4TextVariant.headlineMedium),
          const SizedBox(height: 16),
          ...children.map(
            (child) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
