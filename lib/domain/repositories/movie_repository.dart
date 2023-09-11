import 'package:flutterbasecode/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> fetchMovies();
}
