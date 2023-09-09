import 'package:get/get.dart';
import 'package:tasknotes/presentation/screens/notes/list/notes_list_binding.dart';
import 'package:tasknotes/presentation/screens/task/list/task_list_binding.dart';
import 'package:tasknotes/presentation/screens/task/today/task_today_binding.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    TaskListBinding().dependencies();
    TaskTodayBinding().dependencies();
    NotesListBinding().dependencies();

    Get.put(
      HomeController(
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
        Get.find(),
      ),
    );
  }
}
