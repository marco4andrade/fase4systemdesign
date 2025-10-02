import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../enums/enums.dart';

/// Campo para agregar un comentario
class AddCommentField extends StatefulWidget {
  const AddCommentField({
    super.key,
    required this.onSubmit,
  });

  final ValueChanged<String> onSubmit;

  @override
  State<AddCommentField> createState() => _AddCommentFieldState();
}

class _AddCommentFieldState extends State<AddCommentField> {
  final _controller = TextEditingController();

  void _handleSubmit() {
    if (_controller.text.isNotEmpty) {
      widget.onSubmit(_controller.text);
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Pragma4InputField(
            controller: _controller,
            hintText: 'Agregar comentario...',
            maxLines: 3,
          ),
        ),
        const SizedBox(width: 8.0),
        Pragma4Button(
          text: 'Publicar',
          onPressed: _handleSubmit,
          size: Pragma4ComponentSize.small,
        ),
      ],
    );
  }
}