
# Fase4 System Design

Guía rápida y catálogo completo de componentes incluidos en el paquete `fase4_system_design`.

Este paquete implementa un sistema de diseño para Flutter siguiendo la filosofía de Atomic Design. Está pensado para proveer componentes reutilizables y opinionados (átomos, moléculas, organismos, plantillas y páginas) y un wrapper que aplica el tema del sistema.

Contenido de este README
- Qué incluye el paquete (lista completa de componentes exportados)
- Ejemplo mínimo de integración
- Cómo acceder a colores/valores del tema
- Cómo ejecutar el ejemplo y contribuir

## Qué incluye el paquete (lista completa)

Nota: los nombres reflejan los símbolos exportados por el paquete (ver `lib/fase4_system_design.dart`). A continuación verás el conjunto completo agrupado por nivel con una breve descripción de cada componente.

### Wrapper / Tema
- `Pragma4DesignSystem` — Wrapper que aplica el ThemeData y estilos del sistema a tu app. Envuelve `MaterialApp` o el árbol de widgets para que los componentes usen el tema opinionado.

### Átomos (components básicos)
- `Pragma4Button` — Botón con variantes (primario, secundario, outline) y soporte para estado de carga.
- `Pragma4Text` (y variantes) — Sistema de tipografía (display, headline, body, label) con helpers tipográficos.
- `Pragma4Icon` — Componente de iconografía coherente con el diseño.
- `Pragma4Avatar` — Avatar circular con soporte para imagen/initiales.
- `Pragma4Badge` — Badge pequeño (número o punto) para indicadores.
- `Pragma4Divider` — Separador visual estándar del sistema.
- `Pragma4InputField` — Campo de texto estilizado con validación integrada y adornos.
- `Pragma4Loader` — Indicador de carga (spinner) consistente con el diseño.
- `Pragma4Chip` — Chip/tag seleccionable o estático.
- `Pragma4Switch` — Interruptor (toggle) estilizado.

### Moléculas (componentes combinados)
- `Pragma4SearchField` — Campo de búsqueda con icono y comportamiento de filtrado.
- `Pragma4CardComponent` — Tarjeta flexible con header, título, subtítulo, contenido y footer; soporta imagen en el header.
- `Pragma4ListItem` — Elemento de lista con leading/trailing, selección y decoración por defecto.
- `Pragma4FormGroup` — Agrupador de campos con etiqueta y ayuda/errores.
- `Pragma4ButtonGroup` — Agrupación de botones (e.g., acciones múltiples).
- `Pragma4NavigationItem` — Item compacto pensado para listas de navegación (icon + label + badge).
- `Pragma4AlertMessage` — Mensaje de alerta/feedback (success, warning, error, info).
- `Pragma4ImageWithOverlay` — Imagen con overlay (gradiente + contenido encima).
- `Pragma4StatCard` — Tarjeta de estadística con valor y tendencia.
- `Pragma4ToggleGroup` — Grupo de toggles/chips seleccionables (multi o single select).

### Organismos (componentes complejos)
- `Pragma4AppHeader` — Encabezado de aplicación (app bar) con opciones de navegación y acciones.
- `Pragma4NavigationDrawer` — Cajón de navegación (Drawer) con items y cabecera personalizada.
- `Pragma4DataTable` — Contenedor para `DataTable` que añade scroll horizontal y configuración estándar.
- `Pragma4ProductList` — Organismo de lista/grid de productos (cards) con comportamiento de ejemplo.
- `Pragma4FormLayout` — Layout para formularios largos con columnas o diseño responsivo.
- `Pragma4DashboardStats` — Grid de tarjetas de estadísticas reutilizables.
- `Pragma4UserProfile` — Panel de perfil de usuario con avatar, meta y acciones.
- `Pragma4CommentSection` — Sección de comentarios con lista de items y campo para agregar comentarios.

### Plantillas (templates)
- `Pragma4AppLayout` — Layout base de la aplicación (barra lateral, header, contenido).
- `Pragma4DashboardTemplate` — Plantilla típica de dashboard con zona de estadísticas y contenido.
- `Pragma4FormTemplate` — Plantilla para páginas de formulario con título, descripción y área de campos.
- `Pragma4ListTemplate` — Plantilla para páginas de listado con encabezado, acciones y lista/tablas.

### Páginas reutilizables
- `LoginPage` — Página de inicio de sesión reutilizable con validaciones y opciones (recordarme, signup).
- `SimpleDashboardPage` — Ejemplo de página de dashboard simple que utiliza las plantillas y organismos.

## Ejemplo mínimo de integración

Envuelve tu aplicación con `Pragma4DesignSystem` y usa los componentes exportados:

```dart
import 'package:flutter/material.dart';
import 'package:fase4_system_design/fase4_system_design.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Pragma4DesignSystem(
      child: MaterialApp(
        title: 'Mi App con Fase4',
        home: Scaffold(
          body: Center(
            child: Pragma4Button(text: 'Comenzar', onPressed: () {}),
          ),
        ),
      ),
    );
  }
}
```

## Ejecutar el ejemplo

1. Instala dependencias en la raíz del repo:

```bash
flutter pub get
```

2. Ejecuta la app de ejemplo:

```bash
cd example
flutter pub get
flutter run
```

Comprobaciones estáticas y tests:

```bash
flutter analyze --no-fatal-infos
flutter test
```

## Contribuir

1. Haz fork y crea una rama descriptiva.
2. Añade tests y documentación para cambios visibles.
3. Abre un Pull Request explicando el cambio.


## Dónde encontrar código

- Punto de entrada: `lib/fase4_system_design.dart`
- Código fuente: `lib/src/atoms`, `lib/src/molecules`, `lib/src/organisms`, `lib/src/templates`, `lib/src/pages`

## Licencia

Este proyecto está bajo licencia MIT — consulta el archivo `LICENSE` en la raíz.
