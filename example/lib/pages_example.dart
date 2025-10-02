import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';
import 'pages/showcase_page.dart';

/// Página de ejemplo que muestra cómo usar las páginas reutilizables
class PagesExamplePage extends StatefulWidget {
  const PagesExamplePage({super.key});

  @override
  State<PagesExamplePage> createState() => _PagesExamplePageState();
}

class _PagesExamplePageState extends State<PagesExamplePage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    switch (_currentPageIndex) {
      case 0:
        return _buildPagesMenu();
      case 1:
        return _buildLoginExample();
      case 2:
        return _buildDashboardExample();
      case 3:
        return _buildShowcaseWithHome();
      default:
        return _buildPagesMenu();
    }
  }

  Widget _buildPagesMenu() {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const Center(
                child: Pragma4HeadlineText(
                  'Sistema de Diseño Flutter',
                  variant: Pragma4TextType.headlineLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Pragma4BodyText(
                  'Sistema basado en Atomic Design con páginas reutilizables y demostraciones',
                  color: Theme.of(context).colorScheme.onSurface,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),
              const Pragma4HeadlineText(
                'Páginas Reutilizables',
                variant: Pragma4TextType.headlineMedium,
              ),
              const SizedBox(height: 8),
              Pragma4BodyText(
                'Estas páginas están incluidas en el paquete y pueden ser reutilizadas en cualquier aplicación:',
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(height: 24),
              _buildPageCard(
                title: 'Página de Login',
                description:
                    'Formulario de inicio de sesión completo con validaciones',
                icon: Icons.login,
                onTap: () => setState(() => _currentPageIndex = 1),
              ),
              _buildPageCard(
                title: 'Dashboard Simple',
                description:
                    'Panel de control con métricas y contenido personalizable',
                icon: Icons.dashboard,
                onTap: () => setState(() => _currentPageIndex = 2),
              ),
              const SizedBox(height: 24),
              const Pragma4HeadlineText(
                'Páginas de Demostración',
                variant: Pragma4TextType.headlineSmall,
              ),
              const SizedBox(height: 8),
              Pragma4BodyText(
                'Estas páginas están en el ejemplo y muestran cómo usar los componentes:',
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(height: 16),
              _buildPageCard(
                title: 'Showcase Completo',
                description:
                    'Demostración de todos los componentes del sistema',
                icon: Icons.widgets,
                onTap: () => setState(() => _currentPageIndex = 3),
                isDemoPage: true,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageCard({
    required String title,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
    bool isDemoPage = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Pragma4CardComponent(
        onTap: onTap,
        content: Pragma4ListItem(
          showDecoration: false,
          title: title,
          subtitle: description,
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isDemoPage
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Pragma4Icon(icon, color: Colors.white),
          ),
          trailing: const Pragma4Icon(Icons.chevron_right),
        ),
      ),
    );
  }

  Widget _buildLoginExample() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Pragma4Icon(Icons.home),
          onPressed: () => setState(() => _currentPageIndex = 0),
        ),
        title: const Pragma4HeadlineText(
          'Página de Login',
          variant: Pragma4TextType.headlineSmall,
        ),
      ),
      body: LoginPage(
        title: 'Iniciar Sesión',
        subtitle: 'Ejemplo de página reutilizable',
        onLogin: (email, password, rememberMe) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Login: $email')));
        },
        onForgotPassword: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Recuperar contraseña')));
        },
        onSignUp: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Ir a registro')));
        },
      ),
    );
  }

  Widget _buildDashboardExample() {
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
      onMenuTap: () => setState(() => _currentPageIndex = 0),
      onNotificationTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Notificaciones')));
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

  Widget _buildShowcaseWithHome() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Pragma4Icon(Icons.home),
          onPressed: () => setState(() => _currentPageIndex = 0),
        ),
        title: const Pragma4HeadlineText(
          'Showcase del Sistema',
          variant: Pragma4TextType.headlineSmall,
        ),
      ),
      body: const ShowcasePage(),
    );
  }
}
