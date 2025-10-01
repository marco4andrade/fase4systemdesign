// Widget reutilizable para las secciones principales

import 'package:design_system_example/widgets/section_org_widget.dart';
import 'package:fase4_system_design/fase4_system_design.dart';
import 'package:flutter/material.dart';

class DrawerDemoSection extends StatelessWidget {
  const DrawerDemoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: 'Demo del Drawer',
      children: [
        ElevatedButton(
          onPressed: () => _openDrawerDemo(context),
          child: const Pragma4Text('Abrir Drawer Demo'),
        ),
      ],
    );
  }

  void _openDrawerDemo(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (ctx) => Scaffold(
          appBar: AppBar(title: const Pragma4Text('Demo Drawer')),
          drawer: Pragma4NavigationDrawer(
            header: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(ctx).colorScheme.primary,
              ),
              child: const Pragma4Text(
                'Usuario de Ejemplo',
                color: Colors.white,
              ),
            ),
            items: const [
              Pragma4NavigationDrawerItem(icon: Icons.home, label: 'Inicio'),
              Pragma4NavigationDrawerItem(
                icon: Icons.settings,
                label: 'Ajustes',
              ),
              Pragma4NavigationDrawerItem(icon: Icons.info, label: 'Acerca'),
            ],
            onItemSelected: (index) {
              Navigator.of(ctx).pop();
              ScaffoldMessenger.of(
                ctx,
              ).showSnackBar(SnackBar(content: Text('Seleccionado: $index')));
            },
          ),
          body: const Center(
            child: Pragma4Text(
              'Abre el cajón desde la esquina superior izquierda',
            ),
          ),
        ),
      ),
    );
  }
}