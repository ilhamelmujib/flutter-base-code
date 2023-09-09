import 'package:get/get.dart';
import 'task_menu_controller.dart';

class TaskMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskMenuController());
  }
}
