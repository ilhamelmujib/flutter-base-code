class ResponseModel<T> {
  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResults;
  final bool success;
  final int statusCode;
  final String statusMessage;

  ResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJson) {
    if (json.containsKey('success') && json.containsKey('status_code') && json.containsKey('status_message')) {
      return ResponseModel<T>(
        page: 0,
        results: [],
        totalPages: 0,
        totalResults: 0,
        success: json['success'],
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
      );
    } else {
      return ResponseModel<T>(
        page: json['page'],
        results: (json['results'] as List<dynamic>).map(fromJson).toList(),
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
        success: true,
        statusCode: 0,
        statusMessage: '',
      );
    }
  }
}
