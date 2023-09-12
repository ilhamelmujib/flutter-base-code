import 'package:flutterbasecode/core/utils/log.dart';
import 'package:flutterbasecode/data/models/favorite_model.dart';
import 'package:flutterbasecode/domain/usecases/favorite/toggle_favorite_usecase.dart';
import 'package:flutterbasecode/domain/usecases/movie/fetch_popular_usecase.dart';
import 'package:flutterbasecode/presentation/movie/movie_state.dart';
import 'package:get/get.dart';
import 'package:flutterbasecode/domain/usecases/movie/fetch_now_playing_usecase.dart';

class MovieController extends GetxController {
  final FetchNowPlayingUseCase _fetchNowPlayingUseCase;
  final FetchPopularUseCase _fetchPopularUseCase;
  final ToggleFavoriteUseCase _toggleFavoriteUseCase;

  MovieController(this._fetchNowPlayingUseCase, this._fetchPopularUseCase, this._toggleFavoriteUseCase);

  final MovieState state = MovieState();

  @override
  void onInit() {
    super.onInit();
    _fetchNowPlaying();
    _fetchPopular();
  }

  void _fetchNowPlaying() async {
    try {
      state.nowPlaying.value = await _fetchNowPlayingUseCase.execute();
      Log.debug("SUCCESS _fetchNowPlaying");
    } catch (e) {
      Log.debug(e);
    }
  }

  void _fetchPopular() async {
    try {
      state.popular.value = await _fetchPopularUseCase.execute();
      Log.debug("SUCCESS _fetchNowPlaying");
    } catch (e) {
      Log.debug(e);
    }
  }

  void toggleFavorite(int mediaId, bool favorite) async {
    try {
      final model = FavoriteModel(mediaType: "movie", mediaId: mediaId, favorite: favorite);
      await _toggleFavoriteUseCase.execute(model);
      Log.debug("SUCCESS toggleFavorite");
    } catch (e) {
      Log.debug(e);
    }
  }
}
