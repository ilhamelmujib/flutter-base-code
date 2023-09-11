import 'package:flutterbasecode/data/datasources/remote/client/api_service.dart';
import 'package:flutterbasecode/data/datasources/remote/client/base_response.dart';
import 'package:flutterbasecode/data/models/movie_model.dart';

class MovieRemoteDataSource {
  final ApiService apiService;

  MovieRemoteDataSource(this.apiService);

  Future<List<MovieModel>> fetchMovies() async {
    try {
      final response = await apiService.get('/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc');
      final baseResponse = BaseResponse.fromJson(response, (data) => MovieModel.fromJson(data));
      return baseResponse.results;
    } catch (e) {
      rethrow;
    }
  }
}