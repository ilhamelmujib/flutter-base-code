import 'package:flutterbasecode/domain/entities/movie_entity.dart';
import 'package:flutterbasecode/presentation/movie/intens/movie_intens.dart';
import 'package:flutterbasecode/presentation/movie/states/movie_state.dart';
import 'package:get/get.dart';
import 'package:flutterbasecode/domain/usecases/movie/movie_usecase.dart';

class MovieController extends GetxController {
  final MovieUseCase movieUseCase;

  MovieController(this.movieUseCase);

  final MovieState state = MovieState();
  final Rx<MovieIntent> intent = MovieIntent.none.obs;

  @override
  void onInit() {
    super.onInit();
    _handleIntent();
    intent.value = MovieIntent.fetchMovie;
  }

  void _handleIntent() {
    intent.listen((intent) {
      switch (intent) {
        case MovieIntent.fetchMovie:
          _fetchMovies();
        default:
          break;
      }
    });
  }

  void _fetchMovies() async {
    try {
      state.isLoading.value = true;
      final result = await movieUseCase.fetchMovies();
      state.movies.value = result;
      intent.value = MovieIntent.none;
      state.isLoading.value = false;
    } catch (e) {
      intent.value = MovieIntent.none;
      state.isLoading.value = false;
      // Handle error
    }
  }
}
