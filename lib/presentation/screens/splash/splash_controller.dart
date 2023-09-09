import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasknotes/app/app_pages.dart';

class SplashController extends GetxController {
  SplashController();

  final box = GetStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      if(box.read("email") == null){
        Get.offAllNamed(Routes.sign);
      }else{
        Get.offAllNamed(Routes.home);
      }
    });
  }
}
