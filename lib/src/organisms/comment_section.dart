import 'package:flutter/material.dart';
import '../atoms/atoms.dart';

/// Organismo de sección de comentarios
class Pragma4CommentSection extends StatelessWidget {
  const Pragma4CommentSection({
    super.key,
    required this.comments,
    this.onAddComment,
    this.showAddComment = true,
  });

  final List<CommentData> comments;
  final ValueChanged<String>? onAddComment;
  final bool showAddComment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Pragma4Text(
          'Comentarios (${comments.length})',
          variant: Pragma4TextVariant.headlineSmall,
        ),
        const SizedBox(height: 16.0),
        if (showAddComment && onAddComment != null) ...[
          _AddCommentField(onSubmit: onAddComment!),
          const SizedBox(height: 24.0),
        ],
        ...comments.map(
          (comment) => Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: _CommentItem(comment: comment),
          ),
        ),
      ],
    );
  }
}

/// Widget de elemento de comentario
class _CommentItem extends StatelessWidget {
  const _CommentItem({required this.comment});

  final CommentData comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Pragma4Avatar(
          imageUrl: comment.authorAvatar,
          initials: comment.authorName.isNotEmpty ? comment.authorName[0] : '?',
          size: Pragma4AvatarSize.small,
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Pragma4Text(
                    comment.authorName,
                    variant: Pragma4TextVariant.labelMedium,
                  ),
                  const SizedBox(width: 8.0),
                  Pragma4Text(
                    comment.timeAgo,
                    variant: Pragma4TextVariant.bodySmall,
                    semanticColor: Pragma4TextColor.tertiary,
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Pragma4Text(
                comment.content,
                variant: Pragma4TextVariant.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Campo para agregar un comentario
class _AddCommentField extends StatefulWidget {
  const _AddCommentField({required this.onSubmit});

  final ValueChanged<String> onSubmit;

  @override
  State<_AddCommentField> createState() => _AddCommentFieldState();
}

class _AddCommentFieldState extends State<_AddCommentField> {
  final _controller = TextEditingController();

  void _handleSubmit() {
    if (_controller.text.isNotEmpty) {
      widget.onSubmit(_controller.text);
      _controller.clear();
    }
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
          size: Pragma4ButtonSize.small,
        ),
      ],
    );
  }
}

/// Datos de un comentario
class CommentData {
  const CommentData({
    required this.id,
    required this.authorName,
    required this.authorAvatar,
    required this.content,
    required this.timeAgo,
  });

  final String id;
  final String authorName;
  final String authorAvatar;
  final String content;
  final String timeAgo;
}
