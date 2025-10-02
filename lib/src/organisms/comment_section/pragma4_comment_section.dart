import 'package:flutter/material.dart';
import '../../atoms/atoms.dart';
import '../../enums/enums.dart';
import 'models/comment_data.dart';
import 'widgets/comment_item.dart';
import 'widgets/add_comment_field.dart';

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
          variant: Pragma4TextType.headlineSmall,
        ),
        const SizedBox(height: 16.0),
        if (showAddComment && onAddComment != null) ...[
          AddCommentField(onSubmit: onAddComment!),
          const SizedBox(height: 24.0),
        ],
        ...comments.map(
          (comment) => Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CommentItem(comment: comment),
          ),
        ),
      ],
    );
  }
}