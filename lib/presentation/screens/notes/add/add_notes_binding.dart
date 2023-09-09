import 'package:get/get.dart';
import 'add_notes_controller.dart';

class AddNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddNotesController(Get.find(), Get.find()));
  }
}
