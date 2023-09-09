class TaskModel {
  int? id;
  String? userId;
  String? title;
  String? notes;
  String? time;
  int? repetition;
  int? status;
  String? createdAt;
  String? updatedAt;

  TaskModel({
    this.id,
    this.userId,
    this.title,
    this.notes,
    this.time,
    this.repetition,
    this.status,
    this.createdAt,
    this.updatedAt,
  });


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'notes': notes,
      'time': time,
      'repetition': repetition,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      notes: json['notes'],
      time: json['time'],
      repetition: json['repetition'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

