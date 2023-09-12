import 'package:flutterbasecode/domain/entities/movie_entity.dart';
import 'package:get/get.dart';

class MovieState {
  final nowPlaying = Rx<List<MovieEntity>>([]);
  final popular = Rx<List<MovieEntity>>([]);
}
