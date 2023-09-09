import 'package:get/get.dart';

import 'favorite_notes_controller.dart';

class FavoriteNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteNotesController(Get.find()));
  }
}
