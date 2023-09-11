import 'package:flutterbasecode/data/datasources/remote/client/api_service.dart';
import 'package:flutterbasecode/data/models/response_model.dart';
import 'package:flutterbasecode/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> fetchNowPlaying();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiService apiService;

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
}
