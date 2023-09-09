import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasknotes/presentation/screens/sign/sign_controller.dart';
import '../../../app/app_colors.dart';
import '../../../app/app_pages.dart';
import '../../../app/app_sources.dart';
import '../../widgets/button.dart';
import '../../widgets/image.dart';
import '../../widgets/scaffold.dart';

class SignScreen extends GetView<SignController> {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: ImageSvg(
              AppSources.image("img_sign.svg"),
            ),
          ),
          DefaultButton(
            "Sign in with Google",
            icon: AppSources.icon("ic_google.svg"),
            width: null,
            color: AppColors.black,
            backgroundColor: AppColors.white,
            borderColor: AppColors.border,
            margin: const EdgeInsets.all(10),
            onPressed: () async {
              await controller.signInGoogle();
            },
          )
        ],
      ),
    );
  }
}
