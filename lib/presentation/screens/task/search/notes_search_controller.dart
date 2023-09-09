import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tasknotes/domain/entities/task_entity.dart';
import 'package:tasknotes/domain/usecase/task/fetch_task_use_case.dart';
import '../../../widgets/toast.dart';

class TaskSearchController extends GetxController {
  TaskSearchController(this._fetchTaskUseCase);

  final FetchTaskUseCase _fetchTaskUseCase;
  final RxList<TaskEntity> tasks = RxList.empty();
  final searchController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchTask("");
  }

  fetchTask(String keyword) async {
    final result = await _fetchTaskUseCase.execute();
    result.fold((failure) {
      _showError(failure.message);
    }, (data) {
      tasks.value = keyword.isEmpty
          ? RxList.empty()
          : data.where((element) => element.title.toLowerCase().contains(keyword.toLowerCase()) || element.notes.toLowerCase().contains(keyword.toLowerCase())).toList();
    });
  }

  void _showError(String message) {
    Toast.error(Get.context!, message);
  }
}
