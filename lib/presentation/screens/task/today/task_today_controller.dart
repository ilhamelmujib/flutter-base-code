import 'package:get/get.dart';
import '../../../../domain/entities/task_entity.dart';
import '../../../../domain/usecase/task/fetch_task_use_case.dart';
import '../../../../utils/formatter.dart';
import '../../../widgets/toast.dart';

class TaskTodayController extends GetxController {
  TaskTodayController(this._fetchTaskUseCase);

  final FetchTaskUseCase _fetchTaskUseCase;

  final RxList<TaskEntity> tasks = RxList.empty();

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
      tasks.value = data.where((task) {
        return Formatter().compareToNow(task.time) == 0;
      }).toList()
        ..sort((task1, task2) => task2.time.compareTo(task1.time))
        ..sort((task1, task2) => task1.status ? 1 : -1);
    });
  }

  void _showError(String message) {
    Toast.error(Get.context!, message);
  }
}
