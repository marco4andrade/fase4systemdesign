import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';
import '../routes/app_routes.dart';

/// Página de ejemplo que muestra cómo usar la SimpleDashboardPage reutilizable
class DashboardExamplePage extends StatelessWidget {
  const DashboardExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDashboardPage(
      title: 'Mi Dashboard',
      subtitle: 'Ejemplo de dashboard reutilizable',
      metrics: const [
        SimpleDashboardMetric(
          title: 'Usuarios',
          value: '1,234',
          icon: Icons.people,
        ),
        SimpleDashboardMetric(
          title: 'Ventas',
          value: '\$5,678',
          icon: Icons.attach_money,
        ),
        SimpleDashboardMetric(
          title: 'Órdenes',
          value: '891',
          icon: Icons.shopping_cart,
        ),
        SimpleDashboardMetric(
          title: 'Productos',
          value: '234',
          icon: Icons.inventory,
        ),
      ],
      // Si venimos desde otra página (ej. DesignPagesPage) permitimos volver con pop.
      onMenuTap: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          AppRoutes.goToHome(context);
        }
      },
      onNotificationTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Notificaciones')),
        );
      },
      children: [
        Pragma4CardComponent(
          title: 'Actividad Reciente',
          content: const Column(
            children: [
              Pragma4ListItem(
                title: 'Nueva venta realizada',
                subtitle: 'Producto vendido por \$123',
                leading: Pragma4Icon(Icons.point_of_sale),
              ),
              Divider(height: 1),
              Pragma4ListItem(
                title: 'Usuario registrado',
                subtitle: 'Nuevo cliente en la plataforma',
                leading: Pragma4Icon(Icons.person_add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}