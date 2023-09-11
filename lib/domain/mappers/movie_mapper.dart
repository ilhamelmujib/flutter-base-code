
import 'package:flutterbasecode/data/models/movie_model.dart';
import 'package:flutterbasecode/domain/entities/movie_entity.dart';

class MovieMapper {
  static MovieEntity fromModel(MovieModel model) {
    return MovieEntity(
      id: model.id,
      title: model.title,
      overview: model.overview,
      releaseDate: model.releaseDate,
      posterPath: model.posterPath,
      voteAverage: model.voteAverage.toDouble(),
    );
  }

  static List<MovieEntity> fromModelList(List<MovieModel> models) {
    return models.map((model) => fromModel(model)).toList();
  }
}