import 'package:flutter/material.dart';
import 'package:tasknotes/presentation/screens/task/list/widgets/item_in_progress.dart';

import '../../../../../domain/entities/task_entity.dart';

class ListInProgress extends StatelessWidget {
  const ListInProgress({
    super.key,
    required this.tasks,
    required this.onItemCheckButton,
    required this.onItemTap,
  });

  final List<TaskEntity> tasks;
  final Function(int, bool) onItemCheckButton;
  final Function(TaskEntity) onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ItemInProgress(
          task: tasks[index],
          onItemCheckButton: onItemCheckButton,
          onItemTap: onItemTap,
        );
      },
    );
  }
}
