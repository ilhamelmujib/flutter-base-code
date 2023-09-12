import 'package:flutterbasecode/data/datasources/local/favorite_local_datasource.dart';
import 'package:flutterbasecode/data/datasources/remote/movie_remote_datasource.dart';
import 'package:flutterbasecode/domain/entities/movie_entity.dart';
import 'package:flutterbasecode/domain/repositories/movie_repository.dart';
import '../../domain/mappers/movie_mapper.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  final FavoriteLocalDataSource favoriteLocalDataSource;

  MovieRepositoryImpl({required this.movieRemoteDataSource, required this.favoriteLocalDataSource});

  @override
  Future<List<MovieEntity>> fetchNowPlaying() async {
    try {
      final movieData = await movieRemoteDataSource.fetchNowPlaying();
      final movies = MovieMapper.fromModelList(movieData);
      for (var movie in movies) {
        final isFavorite = await favoriteLocalDataSource.isFavorite('movie', movie.id);
        movie.favorite.value = isFavorite;
      }
      return movies;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MovieEntity>> fetchPopular() async {
    try {
      final movieData = await movieRemoteDataSource.fetchPopular();
      final movies = MovieMapper.fromModelList(movieData);
      for (var movie in movies) {
        final isFavorite = await favoriteLocalDataSource.isFavorite('movie', movie.id);
        movie.favorite.value = isFavorite;
      }
      return movies;
    } catch (e) {
      rethrow;
    }
  }
}
