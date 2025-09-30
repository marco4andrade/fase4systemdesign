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
