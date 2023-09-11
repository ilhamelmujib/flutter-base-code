import 'package:flutterbasecode/domain/entities/movie_entity.dart';
import 'package:get/get.dart';

class MovieState {
  final movies = Rx<List<MovieEntity>>([]);
  final isLoading = false.obs;
}
