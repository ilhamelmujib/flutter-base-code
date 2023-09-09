import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tasknotes/app/app_fonts.dart';
import 'package:tasknotes/domain/entities/task_entity.dart';
import 'package:tasknotes/presentation/screens/task/list/task_list_controller.dart';
import 'package:tasknotes/presentation/screens/task/list/widgets/list_in_progress.dart';
import 'package:tasknotes/presentation/screens/task/list/widgets/list_next_to_do.dart';
import '../../../widgets/text.dart';
import 'widgets/add_new.dart';

class TaskListScreen extends GetView<TaskListController> {
  const TaskListScreen({
    super.key,
    required this.onClickAdd,
    required this.onItemCheckButton,
    required this.onItemTap,
  });

  final Function() onClickAdd;
  final Function(int, bool) onItemCheckButton;
  final Function(TaskEntity) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddNew(
            onClickAdd: onClickAdd,
          ),
          if (controller.tasksInProgress.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: DefaultText(
                    "In Progress 🚴🏻",
                    size: 20,
                    fontFamily: FontFamily.interBold,
                  ),
                ),
                ListInProgress(
                  tasks: controller.tasksInProgress,
                  onItemCheckButton: onItemCheckButton,
                  onItemTap: onItemTap,
                ),
              ],
            ),
          if (controller.tasksNextTodo.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: DefaultText(
                    "Next To Do 🚀",
                    size: 20,
                    fontFamily: FontFamily.interBold,
                  ),
                ),
                ListNextToDo(
                  tasks: controller.tasksNextTodo,
                  onItemTap: onItemTap,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
