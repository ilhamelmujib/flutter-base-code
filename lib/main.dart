import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbasecode/di/dependency.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'core/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  await Dependency.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "Hatam",
          initialRoute: AppPages.initial,
          navigatorKey: Dependency.alice.getNavigatorKey(),
          getPages: AppPages.pages,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              color: Colors.black,
              elevation: 1,
              iconTheme: IconThemeData(color: Colors.black87),
            ),
          ),
        );
      },
    );
  }
}
