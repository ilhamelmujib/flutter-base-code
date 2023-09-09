import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasknotes/domain/entities/task_entity.dart';
import 'package:tasknotes/domain/usecase/task/add_task_use_case.dart';
import 'package:tasknotes/domain/usecase/task/update_task_use_case.dart';
import '../../../widgets/toast.dart';

class AddTaskController extends GetxController {
  AddTaskController(this._addTaskUseCase, this._updateTaskUseCase);

  final AddTaskUseCase _addTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;

  final box = GetStorage();

  final notesFormKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final notesController = TextEditingController();
  final nodeTitle = FocusNode();
  final nodeNotes = FocusNode();

  final RxBool isSwitchDate = false.obs;
  final RxBool isShowCalendar = false.obs;
  final RxBool isSwitchTime = false.obs;
  final RxBool isShowTimePicker = false.obs;

  final focusedDay = DateTime.now().obs;
  final focusedTime = DateTime.now().obs;

  final selectedRepetition = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    if (Get.arguments != null) {
      final TaskEntity task = Get.arguments;
      titleController.text = task.title;
      notesController.text = task.notes;

      if(task.time.second == 1){ // Date Only
        isSwitchDate.value = true;
        focusedDay.value = task.time;
      }else if(task.time.second == 2){ // Date With Time
        isSwitchDate.value = true;
        isSwitchTime.value = true;
        focusedDay.value = task.time;
        focusedTime.value = task.time;
      }

      selectedRepetition.value = task.repetition;

    }
  }

  DateTime _time() {
    return isSwitchDate.value && isSwitchTime.value
        ? _dateWithTime()
        : isSwitchDate.value
        ? _dateOnly()
        : _dateZeroValue();
  }


  DateTime _dateZeroValue() {
    return DateTime(0);
  }

  DateTime _dateOnly() {
    return DateTime(
        focusedDay.value.year,
        focusedDay.value.month,
        focusedDay.value.day,
        23,
        59,
        1,
    );
  }

  DateTime _dateWithTime() {
    return DateTime(
      focusedDay.value.year,
      focusedDay.value.month,
      focusedDay.value.day,
      focusedTime.value.hour,
      focusedTime.value.minute,
      2,
    );
  }

  addTask() async {
    if (titleController.text.isEmpty) {
      _showError("Please complete the data");
      return;
    }

    if(!isSwitchDate.value){
      selectedRepetition.value = 0;
    }

    final data = TaskEntity(
      id: DateTime.now().microsecondsSinceEpoch,
      userId: box.read("id"),
      title: titleController.text,
      notes: notesController.text,
      time: _time(),
      repetition: selectedRepetition.value,
      status: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    final result = await _addTaskUseCase.execute(data);
    result.fold((failure) {
      _showError(failure.message);
    }, (data) {
      Get.back(result: true);
      Toast.success(Get.context!, "Added!");
    });
  }

  updateTask() async {
    if (titleController.text.isEmpty) {
      _showError("Please complete the data");
      return;
    }

    if(!isSwitchDate.value){
      selectedRepetition.value = 0;
    }

    final TaskEntity task = Get.arguments;

    final data = TaskEntity(
      id: task.id,
      userId: task.userId,
      title: titleController.text,
      notes: notesController.text,
      time: _time(),
      repetition: selectedRepetition.value,
      status: task.status,
      createdAt: task.createdAt,
      updatedAt: DateTime.now(),
    );
    final result = await _updateTaskUseCase.execute(data);
    result.fold((failure) {
      _showError(failure.message);
    }, (data) {
      Get.back(result: true);
      Toast.success(Get.context!, "Updated!");
    });
  }

  void _showError(String message) {
    Toast.error(Get.context!, message);
  }
}
