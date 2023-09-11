import 'package:dio/dio.dart';

class ApiService {
  final Dio client;

  ApiService(this.client);

  Future<Map<String, dynamic>> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(endpoint, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await client.post(endpoint, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to make a POST request to API');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await client.put(endpoint, data: data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to make a PUT request to API');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete(String endpoint) async {
    try {
      final response = await client.delete(endpoint);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to make a DELETE request to API');
      }
    } catch (e) {
      rethrow;
    }
  }
}
