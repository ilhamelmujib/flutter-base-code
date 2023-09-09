import 'package:get/get.dart';
import 'package:tasknotes/presentation/screens/home/home_binding.dart';
import 'package:tasknotes/presentation/screens/notes/add/add_notes_binding.dart';
import 'package:tasknotes/presentation/screens/notes/search/notes_search_binding.dart';
import 'package:tasknotes/presentation/screens/notes/search/notes_search_screen.dart';
import 'package:tasknotes/presentation/screens/sign/sign_binding.dart';
import 'package:tasknotes/presentation/screens/home/home_screen.dart';
import 'package:tasknotes/presentation/screens/notes/add/add_notes_screen.dart';
import 'package:tasknotes/presentation/screens/sign/sign_screen.dart';
import 'package:tasknotes/presentation/screens/splash/splash_screen.dart';
import 'package:tasknotes/presentation/screens/task/add/add_task_screen.dart';
import 'package:tasknotes/presentation/screens/task/search/notes_search_binding.dart';
import 'package:tasknotes/presentation/screens/task/search/notes_search_screen.dart';
import '../presentation/screens/splash/splash_binding.dart';
import '../presentation/screens/task/add/add_task_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: _Paths.sign,
      page: () => const SignScreen(),
      binding: SignBinding(),
    ),

    GetPage(
      name: _Paths.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.taskAdd,
      page: () => const AddTaskScreen(),
      binding: AddTaskBinding(),
    ),

    GetPage(
      name: _Paths.notesAdd,
      page: () => const AddNotesScreen(),
      binding: AddNotesBinding(),
    ),

    GetPage(
      name: _Paths.notesSearch,
      page: () => const NotesSearchScreen(),
      binding: NotesSearchBinding(),
    ),

    GetPage(
      name: _Paths.taskSearch,
      page: () => const TaskSearchScreen(),
      binding: TaskSearchBinding(),
    ),
  ];
}
