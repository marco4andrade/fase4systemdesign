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