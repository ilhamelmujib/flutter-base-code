import 'package:flutter/material.dart';
import 'package:tasknotes/presentation/screens/task/today/widgets/task_item.dart';
import '../../../../domain/entities/task_entity.dart';
import '../../task/today/widgets/header_dialog.dart';

class TaskTodayDialog extends StatelessWidget {

  const TaskTodayDialog({super.key, required this.scrollController, required this.tasks, required this.onItemCheckButton, });

  final ScrollController scrollController;
  final List<TaskEntity> tasks;
  final Function(int, bool) onItemCheckButton;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        const HeaderDialog(),
        for (int index = 0; index < tasks.length; index++)
          TaskItem(
            onItemCheckButton: onItemCheckButton,
            task: tasks[index],
            topRadius: index == 0 ? 20 : 0,
            bottomRadius: index == tasks.length - 1 ? 20 : 0,
          ),
        const SizedBox(height: 20)
      ],
    );
  }
}

