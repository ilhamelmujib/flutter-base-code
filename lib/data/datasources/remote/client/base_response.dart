class BaseResponse<T> {
  final List<T> results;

  BaseResponse({required this.results});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final resultsList = json['results'] as List<Map<String, dynamic>>;
    final results = resultsList.map((data) => fromJson(data)).toList();
    return BaseResponse<T>(results: results);
  }
}
