import 'package:flutterbasecode/domain/entities/movie_entity.dart';
import 'package:flutterbasecode/domain/repositories/movie_repository.dart';

class MovieUseCase {
  final MovieRepository repository;

  MovieUseCase(this.repository);

  Future<List<MovieEntity>> fetchMovies() async {
    return await repository.fetchMovies();
  }
}
