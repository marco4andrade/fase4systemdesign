import 'package:fase4_system_design/fase4_system_design.dart';
import 'package:flutter/material.dart';

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

          _buildSection('Campo de Búsqueda', [
            const Pragma4SearchField(hintText: 'Buscar cualquier cosa...'),
          ]),

          _buildSection('Tarjetas', [
            Pragma4CardComponent(
              imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
              title: 'Tarjeta de Ejemplo',
              subtitle: 'Este es un subtítulo de tarjeta',
              content: Pragma4Text('El contenido de la tarjeta va aquí'),
            ),
          ]),

          _buildSection('Elementos de Lista', [
            const Pragma4ListItem(
              title: 'Título del Elemento',
              subtitle: 'Subtítulo del elemento',
              leading: Pragma4Icon(Icons.person),
              trailing: Pragma4Icon(Icons.arrow_forward_ios),
            ),
          ]),

          _buildSection('Mensajes de Alerta', [
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
          ]),

            _buildSection('Imagen con overlay', [
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
            ]),
            _buildSection('Grupo de Toggles', [
              const _ToggleGroupDemo(),
            ]),
        ],
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

class _ToggleGroupDemo extends StatefulWidget {
  const _ToggleGroupDemo({Key? key}) : super(key: key);

  @override
  State<_ToggleGroupDemo> createState() => _ToggleGroupDemoState();
}

class _ToggleGroupDemoState extends State<_ToggleGroupDemo> {
  final _items = const [
    Pragma4ToggleItem(value: 'a', label: 'Opción A'),
    Pragma4ToggleItem(value: 'b', label: 'Opción B'),
    Pragma4ToggleItem(value: 'c', label: 'Opción C'),
  ];

  Set<String> _selected = {'a'};

  void _onChange(Set<String> newSel) {
    setState(() => _selected = newSel);
  }

  @override
  Widget build(BuildContext context) {
    return Pragma4ToggleGroup<String>(
      items: _items,
      selectedItems: _selected,
      onSelectionChanged: _onChange,
      multiSelect: true,
    );
  }
}
