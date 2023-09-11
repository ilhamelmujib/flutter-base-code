import 'package:dio/dio.dart';

class ApiService {
  final Dio client;

  ApiService(this.client);

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await client.get(endpoint);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {
      rethrow;
    }
  }
}
