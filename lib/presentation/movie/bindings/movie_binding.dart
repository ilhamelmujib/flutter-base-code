import 'package:flutterbasecode/data/repositories/movie_repository_impl.dart';
import 'package:flutterbasecode/domain/usecases/movie/movie_usecase.dart';
import 'package:get/get.dart';
import 'package:flutterbasecode/presentation/movie/controllers/movie_controller.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieUseCase(Get.find<MovieRepositoryImpl>()));
    Get.lazyPut(() => MovieController(Get.find()));
  }
}
