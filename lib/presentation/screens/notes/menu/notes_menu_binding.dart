import 'package:get/get.dart';
import 'notes_menu_controller.dart';

class NotesMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotesMenuController());
  }
}
