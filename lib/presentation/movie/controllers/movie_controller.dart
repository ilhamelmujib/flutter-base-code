import 'package:flutterbasecode/data/models/favorite_model.dart';
import 'package:flutterbasecode/domain/entities/movie_entity.dart';
import 'package:flutterbasecode/domain/usecases/favorite/toggle_favorite_usecase.dart';
import 'package:flutterbasecode/presentation/movie/intens/movie_intens.dart';
import 'package:flutterbasecode/presentation/movie/states/movie_state.dart';
import 'package:get/get.dart';
import 'package:flutterbasecode/domain/usecases/movie/fetch_now_playing_usecase.dart';

class MovieController extends GetxController {
  final FetchNowPlayingUseCase fetchNowPlayingUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  MovieController(this.fetchNowPlayingUseCase, this.toggleFavoriteUseCase);

  final MovieState state = MovieState();
  final Rx<MovieIntent> intent = MovieIntent.none.obs;

  @override
  void onInit() {
    super.onInit();
    intent.listen((intent) {
      switch (intent) {
        case MovieIntent.fetchNowPlaying:
          _fetchNowPlaying();
        case MovieIntent.toggleFavorite:
          // _toggleFavorite();
        default:
          break;
      }
    });
    intent.value = MovieIntent.fetchNowPlaying;
  }

  void _fetchNowPlaying() async {
    try {
      state.nowPlaying.value = await fetchNowPlayingUseCase.execute();
    } catch (e) {
      print(e);
    }
  }

  void _toggleFavorite(FavoriteModel model) async {
    try {
      await toggleFavoriteUseCase.execute(model);
    } catch (e) {
      print(e);
    }
  }
}
