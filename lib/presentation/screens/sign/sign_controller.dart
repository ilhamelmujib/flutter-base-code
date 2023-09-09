import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../app/app_pages.dart';
import '../../widgets/toast.dart';

class SignController extends GetxController {
  SignController();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );

  final box = GetStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  signInGoogle() async {
    try {
      final result = await _googleSignIn.signIn();
      if (result != null) {
        await box.write("id", result.id);
        await box.write("email", result.email);
        await box.write("name", result.displayName);
        await box.write("photo", result.photoUrl);
        await Get.offAllNamed(Routes.home);
      }else{
        _showError("Login failed!");
      }
    } catch (e) {
      print(e);
      _showError("Something wrong!");
    }
  }

  void _showError(String message) {
    Toast.error(Get.context!, message);
  }
}
