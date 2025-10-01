import 'package:fase4_system_design/fase4_system_design.dart';
import 'package:flutter/material.dart';
import '../widgets/component_section_vertical.dart';
import '../widgets/toggle_group_demo.dart';

/// Showcase moleculas
class MoleculesPage extends StatelessWidget {
  const MoleculesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Pragma4Text(
            'Moléculas',
            variant: Pragma4TextVariant.displayMedium,
          ),
          const SizedBox(height: 16),
          const Pragma4Text(
            'Componentes construidos a partir de átomos trabajando juntos',
            variant: Pragma4TextVariant.bodyLarge,
          ),
          const SizedBox(height: 32),

          ComponentSectionVertical(
            title: 'Campo de Búsqueda',
            children: [
              const Pragma4SearchField(hintText: 'Buscar cualquier cosa...'),
            ],
          ),

          ComponentSectionVertical(
            title: 'Tarjetas',
            children: [
              Pragma4CardComponent(
                imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
                title: 'Tarjeta de Ejemplo',
                subtitle: 'Este es un subtítulo de tarjeta',
                content: Pragma4Text('El contenido de la tarjeta va aquí'),
              ),
            ],
          ),

          ComponentSectionVertical(
            title: 'Elementos de Lista',
            children: [
              const Pragma4ListItem(
                title: 'Título del Elemento',
                subtitle: 'Subtítulo del elemento',
                leading: Pragma4Icon(Icons.person),
                trailing: Pragma4Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),

          ComponentSectionVertical(
            title: 'Mensajes de Alerta',
            children: [
              const Pragma4AlertMessage(
                title: 'Éxito',
                message: '¡Operación completada exitosamente!',
                variant: Pragma4AlertVariant.success,
              ),
              const Pragma4AlertMessage(
                title: 'Advertencia',
                message: 'Por favor revisa tu entrada.',
                variant: Pragma4AlertVariant.warning,
              ),
            ],
          ),

            ComponentSectionVertical(
              title: 'Imagen con overlay',
              children: [
                Pragma4ImageWithOverlay(
                  imageUrl: 'https://images.unsplash.com/photo-1506765515384-028b60a970df',
                  height: 180,
                  borderRadius: 12.0,
                  overlay: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Pragma4Text(
                        'Título sobre imagen',
                        variant: Pragma4TextVariant.headlineSmall,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ComponentSectionVertical(
              title: 'Grupo de Toggles',
              children: [
                const ToggleGroupDemo(),
              ],
            ),
        ],
      ),
    );
  }
}
