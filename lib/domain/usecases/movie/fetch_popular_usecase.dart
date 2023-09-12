import 'package:flutterbasecode/domain/entities/movie_entity.dart';
import 'package:flutterbasecode/domain/repositories/movie_repository.dart';

class FetchPopularUseCase {
  final MovieRepository repository;

  FetchPopularUseCase(this.repository);

  Future<List<MovieEntity>> execute() async {
    return await repository.fetchPopular();
  }
}
