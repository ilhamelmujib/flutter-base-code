import 'package:get/get.dart';
import 'sign_controller.dart';

class SignBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignController());
  }
}
