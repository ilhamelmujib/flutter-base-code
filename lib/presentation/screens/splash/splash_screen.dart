import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/app_colors.dart';
import '../../../app/app_sources.dart';
import '../../widgets/image.dart';
import '../../widgets/scaffold.dart';
import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController>{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: ImageSvg(
          AppSources.image("img_logo.svg"),
        ),
      ),
    );
  }
}

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreens> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        // context.router.push(const SignRoute());
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: ImageSvg(
          AppSources.image("img_logo.svg"),
        ),
      ),
    );
  }
}
