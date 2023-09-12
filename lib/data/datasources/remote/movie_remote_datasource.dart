import 'package:flutterbasecode/data/datasources/remote/client/api_client.dart';
import 'package:flutterbasecode/data/models/response_model.dart';
import 'package:flutterbasecode/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> fetchNowPlaying();
  Future<List<MovieModel>> fetchPopular();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient apiService;

  MovieRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<MovieModel>> fetchNowPlaying() async {
    try {
      final response = await apiService
          .get("/movie/now_playing", queryParameters: {"page": 1});
      final data = ResponseModel.fromJson(response, (data) => MovieModel.fromJson(data));
      return data.results;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> fetchPopular() async {
    try {
      final response = await apiService
          .get("/movie/popular", queryParameters: {"page": 2  });
      final data = ResponseModel.fromJson(response, (data) => MovieModel.fromJson(data));
      return data.results;
    } catch (e) {
      rethrow;
    }
  }
}
