import 'package:flutterbasecode/data/repositories/favorite_repository_impl.dart';
import 'package:flutterbasecode/data/repositories/movie_repository_impl.dart';
import 'package:flutterbasecode/domain/usecases/favorite/toggle_favorite_usecase.dart';
import 'package:flutterbasecode/domain/usecases/movie/fetch_now_playing_usecase.dart';
import 'package:get/get.dart';
import 'package:flutterbasecode/presentation/movie/controllers/movie_controller.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchNowPlayingUseCase(Get.find<MovieRepositoryImpl>()));
    Get.lazyPut(() => ToggleFavoriteUseCase(Get.find<FavoriteRepositoryImpl>()));
    Get.lazyPut(() => MovieController(Get.find(), Get.find()));
  }
}
