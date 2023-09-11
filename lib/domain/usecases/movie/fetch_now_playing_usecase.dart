import 'package:flutterbasecode/domain/entities/movie_entity.dart';
import 'package:flutterbasecode/domain/repositories/movie_repository.dart';

class FetchNowPlayingUseCase {
  final MovieRepository repository;

  FetchNowPlayingUseCase(this.repository);

  Future<List<MovieEntity>> execute() async {
    return await repository.fetchNowPlaying();
  }
}
