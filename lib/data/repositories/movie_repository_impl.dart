import 'package:flutterbasecode/data/datasources/remote/movie_remote_datasource.dart';
import 'package:flutterbasecode/domain/entities/movie_entity.dart';
import 'package:flutterbasecode/domain/repositories/movie_repository.dart';

import '../../domain/mappers/movie_mapper.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<MovieEntity>> fetchMovies() async {
    try {
      final movieData = await remoteDataSource.fetchMovies();
      final movies = MovieMapper.fromModelList(movieData);
      return movies;
    } catch (e) {
      rethrow;
    }
  }
}
