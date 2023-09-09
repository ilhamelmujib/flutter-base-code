import 'package:get/get.dart';
import 'package:tasknotes/domain/usecase/notes/delete_notes_use_case.dart';
import 'package:tasknotes/domain/usecase/notes/fetch_notes_use_case.dart';
import 'package:tasknotes/domain/usecase/notes/update_favorite_notes_use_case.dart';
import 'package:tasknotes/domain/usecase/task/delete_task_use_case.dart';
import '../../../domain/usecase/task/fetch_task_use_case.dart';
import '../../../domain/usecase/task/update_status_task_use_case.dart';
import '../../../utils/formatter.dart';
import '../../widgets/toast.dart';

class HomeController extends GetxController {
  HomeController(
    this._fetchTaskUseCase,
    this._updateStatusTaskUseCase,
    this._deleteTaskUseCase,
    this._fetchNotesUseCase,
    this._updateFavoriteNotesUseCase,
    this._deleteNotesUseCase,
  );

  final FetchTaskUseCase _fetchTaskUseCase;
  final UpdateStatusTaskUseCase _updateStatusTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  final FetchNotesUseCase _fetchNotesUseCase;
  final UpdateFavoriteNotesUseCase _updateFavoriteNotesUseCase;
  final DeleteNotesUseCase _deleteNotesUseCase;

  RxInt slideIndex = 1.obs;
  RxDouble percentageTask = 0.0.obs;
  RxInt favoriteNotes = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchTask();
    await fetchNotes();
  }

  fetchTask() async {
    final result = await _fetchTaskUseCase.execute();
    result.fold((failure) {
      _showError(failure.message);
    }, (data) {
      final task = data.where((task) {
        return Formatter().compareToNow(task.time) == 0;
      });
      percentageTask.value = task.isEmpty
          ? 0
          : (task.where((task) => task.status).length / task.length) * 100;
    });
  }

  updateStatusTask(int id, bool status) async {
    final result = await _updateStatusTaskUseCase.execute(id, status ? 1 : 0);
    result.fold((failure) {
      _showError(failure.message);
    }, (data) {
      Toast.success(Get.context!, "Done!");
    });
  }

  deleteTask(int id) async {
    final result = await _deleteTaskUseCase.execute(id);
    result.fold((failure) {
      _showError(failure.message);
    }, (data) {
      Toast.success(Get.context!, "Deleted!");
    });
  }

  fetchNotes() async {
    final result = await _fetchNotesUseCase.execute();
    result.fold((failure) {
      _showError(failure.message);
    }, (data) {
      final task = data.where((notes) {
        return notes.isFavorite;
      });
      favoriteNotes.value = task.length;
    });
  }

  updateFavoriteNotes(int id, bool isFavorite) async {
    final result =
        await _updateFavoriteNotesUseCase.execute(id, isFavorite ? 1 : 0);
    result.fold((failure) {
      _showError(failure.message);
    }, (data) {
      Toast.success(Get.context!, isFavorite ? "Favorite!" : "Unfavorite!");
    });
  }

  deleteNotes(int id) async {
    final result = await _deleteNotesUseCase.execute(id);
    result.fold((failure) {
      _showError(failure.message);
    }, (data) {
      Toast.success(Get.context!, "Deleted!");
    });
  }

  void _showError(String message) {
    Toast.error(Get.context!, message);
  }
}
