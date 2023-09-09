import 'package:get/get.dart';
import 'notes_search_controller.dart';

class NotesSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotesSearchController(Get.find()));
  }
}
