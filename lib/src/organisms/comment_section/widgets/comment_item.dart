import 'package:flutter/material.dart';
import '../../../atoms/atoms.dart';
import '../../../enums/enums.dart';
import '../models/comment_data.dart';

/// Widget de elemento de comentario
class CommentItem extends StatelessWidget {
  const CommentItem({
    super.key,
    required this.comment,
  });

  final CommentData comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Pragma4Avatar(
          imageUrl: comment.authorAvatar,
          initials: comment.authorName.isNotEmpty ? comment.authorName[0] : '?',
          size: Pragma4ComponentSize.small,
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
                    variant: Pragma4TextType.labelMedium,
                  ),
                  const SizedBox(width: 8.0),
                  Pragma4Text(
                    comment.timeAgo,
                    variant: Pragma4TextType.bodySmall,
                    semanticColor: Pragma4ComponentColor.muted,
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Pragma4Text(
                comment.content,
                variant: Pragma4TextType.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}