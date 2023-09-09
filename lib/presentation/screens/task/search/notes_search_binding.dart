import 'package:get/get.dart';
import 'notes_search_controller.dart';

class TaskSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskSearchController(Get.find()));
  }
}
