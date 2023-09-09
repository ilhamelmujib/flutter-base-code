import 'package:get/get.dart';
import 'task_today_controller.dart';

class TaskTodayBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskTodayController(Get.find()));
  }
}
