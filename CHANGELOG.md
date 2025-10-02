## 1.1.0

Refactor estructural y mejoras internas del paquete sin romper compatibilidad mayor:

### Cambios clave
- Refactor del componente base de tarjeta (`Pragma4CardComponent`) para mejorar el manejo responsivo de altura y evitar overflows verticales:
	- Uso de `LayoutBuilder` y padding/espaciado adaptativo.
	- Soporte de borde configurable (color y grosor) con valores por defecto.
	- Mejor administración de secciones (header, title, content, footer) usando `Flexible` / `IntrinsicHeight` para reducir riesgos de overflow.
- Ajustes responsivos en `Pragma4StatCard` y grid de métricas para reducir casos de *bottom overflow* en layouts densos.

### Mejoras internas
- Consolidación de estilos y espaciados dinámicos para tarjetas y métricas.
- Preparación para futura modularización de páginas de ejemplo sin afectar la API pública.
- Limpieza de imports y eliminación de duplicaciones menores.

### Notas de compatibilidad
- No se introducen cambios breaking en la API pública exportada.
- El borde rojo por defecto puede ajustarse pasando parámetros de borde en `Pragma4CardComponent` si no se desea ese estilo.
- Las páginas de ejemplo actuales siguen funcionando; la nueva estructura sugerida es opt‑in.

---

## 1.0.0

Versión preparada para distribución en la tienda. Esta versión 1.0.0 incluye la API pública estabilizada del sistema de diseño y todos los componentes listos para su consumo:

- Wrapper de tema: `Pragma4DesignSystem`.
- Átomos: botones, texto, iconos, avatar, badge, divider, input, loader, chip, switch.
- Moléculas: search field, card component (con soporte de imagen y placeholder), list item (con decoración por defecto y `showDecoration`), image with overlay, toggle group, stat card.
- Organismos: app header, navigation drawer, data table, product list, form layout, dashboard stats, user profile, comment section.
- Plantillas: app layout, dashboard template, form template, list template.
- Páginas de ejemplo y demo ubicadas en `example/`.

Notas:
- Tipografía global ajustada a Consolas para esta versión.
- `Pragma4ImageCard` se conserva como envoltorio; se recomienda migrar a `Pragma4CardComponent` con campos de imagen.

## 0.0.1

Primera versión del sistema de diseño para Flutter con tokens (colores, tipografía, espaciado, sombras), componentes atómicos, moléculas, organismos y plantillas base siguiendo Atomic Design.
