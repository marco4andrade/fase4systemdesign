import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';
import 'pages_example.dart';


///
/// Fase4 System Design es un paquete de componentes UI
/// para Flutter, basado en Atomic Design. Proporciona un wrapper
/// (`Pragma4DesignSystem`) que aplica el tema interno y un conjunto
/// de componentes reutilizables (botones, textos, iconos, layouts,
/// templates y más). 
///
/// Uso rápido: envuelve tu app con `Pragma4DesignSystem` y usa
/// los componentes exportados desde `package:fase4_system_design/fase4_system_design.dart`.

void main() {
  runApp(const DesignSystemApp());
}

class DesignSystemApp extends StatelessWidget {
  const DesignSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Pragma4DesignSystem(
      child: MaterialApp(
        title: 'Muestra del Sistema de Diseño',
        themeMode: ThemeMode.light,
        home: const PagesExamplePageWithHome(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class PagesExamplePageWithHome extends StatelessWidget {
  const PagesExamplePageWithHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const PagesExamplePage(),
    );
  }
}