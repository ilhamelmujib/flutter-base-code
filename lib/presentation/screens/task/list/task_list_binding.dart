import 'package:get/get.dart';
import 'package:tasknotes/presentation/screens/task/list/task_list_controller.dart';

class TaskListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskListController(Get.find()));
  }
}
