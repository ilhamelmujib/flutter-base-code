class FavoriteModel {
  final int? id;
  final String mediaType;
  final int mediaId;
  final bool favorite;

  FavoriteModel({
    this.id,
    required this.mediaType,
    required this.mediaId,
    required this.favorite,
  });

  Map<String, dynamic> toJson() {
    return {
      "media_type": mediaType,
      "media_id": mediaId,
      "favorite": favorite,
    };
  }

  factory FavoriteModel.fromJson(Map<String, dynamic> map) {
    return FavoriteModel(
      mediaType: map['media_type'],
      mediaId: map['media_id'],
      favorite: map['favorite'] == 1,
    );
  }
}
