import 'package:flutterbasecode/presentation/movie/bindings/movie_binding.dart';
import 'package:flutterbasecode/presentation/movie/screens/movie_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.movie;
  static final pages = [
    GetPage(
        name: AppRoutes.movie,
        page: () => const MovieScreen(),
        binding: MovieBinding()),
  ];
}
