import 'package:get/get.dart';
import 'notes_list_controller.dart';

class NotesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotesListController(Get.find()));
  }
}
