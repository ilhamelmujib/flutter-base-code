import 'package:get/get.dart';
import 'add_task_controller.dart';

class AddTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddTaskController(Get.find(), Get.find()));
  }
}