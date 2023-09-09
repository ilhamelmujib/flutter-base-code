class NotesEntity {
  final int id;
  final String userId;
  final String text;
  final bool isFavorite;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotesEntity({
    required this.id,
    required this.userId,
    required this.text,
    required this.isFavorite,
    required this.createdAt,
    required this.updatedAt,
  });
}
