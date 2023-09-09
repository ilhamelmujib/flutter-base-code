import 'package:flutterbasecode/presentation/counter/bindings/counter_binding.dart';
import 'package:flutterbasecode/presentation/counter/screens/counter_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.counter;
  static final pages = [
    GetPage(
        name: AppRoutes.counter,
        page: () => const CounterScreen(),
        binding: CounterBinding()),
  ];
}
