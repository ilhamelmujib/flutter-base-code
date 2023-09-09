import 'package:get/get.dart';
import 'package:tasknotes/data/datasources/local/helpers/notes_database_helper.dart';
import 'package:tasknotes/data/datasources/local/notes_local_data_source.dart';
import 'package:tasknotes/data/repositories/notes_repository_impl.dart';
import 'package:tasknotes/domain/usecase/notes/add_notes_use_case.dart';
import 'package:tasknotes/domain/usecase/notes/delete_notes_use_case.dart';
import 'package:tasknotes/domain/usecase/notes/fetch_notes_use_case.dart';
import 'package:tasknotes/domain/usecase/notes/update_favorite_notes_use_case.dart';
import 'package:tasknotes/domain/usecase/notes/update_notes_use_case.dart';
import 'package:tasknotes/domain/usecase/task/delete_task_use_case.dart';
import 'package:tasknotes/domain/usecase/task/update_task_use_case.dart';
import '../data/datasources/local/database/database_source.dart';
import '../data/datasources/local/helpers/task_database_helper.dart';
import '../data/datasources/local/task_local_data_source.dart';
import '../data/repositories/task_repository_impl.dart';
import '../domain/usecase/task/add_task_use_case.dart';
import '../domain/usecase/task/fetch_task_use_case.dart';
import '../domain/usecase/task/update_status_task_use_case.dart';

class DependencyCreator {
  static init() {
    // Database
    Get.lazyPut(() => DatabaseSource(), fenix: true);

    // Task Database
    Get.lazyPut(() => TaskDatabaseHelper(databaseSource: Get.find()),
        fenix: true);
    Get.lazyPut(
      () => TaskRepositoryImpl(
          localDataSource: TaskLocalDataSourceImpl(databaseHelper: Get.find())),
      fenix: true,
    );

    // Task UseCase
    Get.lazyPut(() => AddTaskUseCase(Get.find<TaskRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => FetchTaskUseCase(Get.find<TaskRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => UpdateStatusTaskUseCase(Get.find<TaskRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => DeleteTaskUseCase(Get.find<TaskRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => UpdateTaskUseCase(Get.find<TaskRepositoryImpl>()),
        fenix: true);

    // Notes Database
    Get.lazyPut(() => NotesDatabaseHelper(databaseSource: Get.find()),
        fenix: true);
    Get.lazyPut(
          () => NotesRepositoryImpl(
          localDataSource: NotesLocalDataSourceImpl(databaseHelper: Get.find())),
      fenix: true,
    );

    // Notes UseCase
    Get.lazyPut(() => AddNotesUseCase(Get.find<NotesRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => FetchNotesUseCase(Get.find<NotesRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => UpdateFavoriteNotesUseCase(Get.find<NotesRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => DeleteNotesUseCase(Get.find<NotesRepositoryImpl>()),
        fenix: true);
    Get.lazyPut(() => UpdateNotesUseCase(Get.find<NotesRepositoryImpl>()),
        fenix: true);
  }
}
