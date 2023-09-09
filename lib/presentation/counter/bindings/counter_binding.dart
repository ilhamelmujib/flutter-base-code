import 'package:flutterbasecode/data/repositories/counter_repository_impl.dart';
import 'package:flutterbasecode/domain/usecases/counter_usecase.dart';
import 'package:get/get.dart';
import 'package:flutterbasecode/presentation/counter/controllers/counter_controller.dart';

class CounterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterUseCase(Get.find<CounterRepositoryImpl>()));
    Get.lazyPut(() => CounterController(Get.find()));
  }
}
