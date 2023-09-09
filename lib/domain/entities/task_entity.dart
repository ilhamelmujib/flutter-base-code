class TaskEntity{
  final int id;
  final String userId;
  final String title;
  final String notes;
  final DateTime time;
  final int repetition;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;

  TaskEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.notes,
    required this.time,
    required this.repetition,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}
