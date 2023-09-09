class NotesModel {
  int? id;
  String? userId;
  String? text;
  int? isFavorite;
  String? createdAt;
  String? updatedAt;

  NotesModel({
    this.id,
    this.userId,
    this.text,
    this.isFavorite,
    this.createdAt,
    this.updatedAt,
  });


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'text': text,
      'isFavorite': isFavorite,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory NotesModel.fromJson(Map<String, dynamic> json) {
    return NotesModel(
      id: json['id'],
      userId: json['userId'],
      text: json['text'],
      isFavorite: json['isFavorite'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

