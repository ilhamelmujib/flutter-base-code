import 'package:get/get.dart';
import 'package:tasknotes/domain/entities/task_entity.dart';
import 'package:tasknotes/domain/usecase/task/fetch_task_use_case.dart';
import 'package:tasknotes/utils/formatter.dart';
import '../../../widgets/toast.dart';

class TaskListController extends GetxController {
  TaskListController(this._fetchTaskUseCase);

  final FetchTaskUseCase _fetchTaskUseCase;

  final RxList<TaskEntity> tasksInProgress = RxList.empty();
  final RxList<TaskEntity> tasksNextTodo = RxList.empty();

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchTask();
  }

  fetchTask() async {
    final result = await _fetchTaskUseCase.execute();
    result.fold((failure) {
      _showError(failure.message);
    }, (data) {
      tasksInProgress.value = data.where((task) {
        return !task.status &&
            (Formatter().compareToNow(task.time) == 0 ||
                Formatter().compareToNow(task.time) < 0);
      }).toList()
        ..sort((task1, task2) => task1.time.compareTo(task2.time))
        ..sort((task1, task2) {
          final isDueDate = Formatter().compareToNow(task1.time, format: "yyyy-MM-dd HH:mm:ss") < 0;
          return isDueDate ? 1 : -1;
        });

      tasksNextTodo.value = data.where((task) {
        return Formatter().compareToNow(task.time) > 0;
      }).toList()
        ..sort((task1, task2) => task1.time.compareTo(task2.time));
    });
  }

  void _showError(String message) {
    Toast.error(Get.context!, message);
  }
}
