import 'package:flutter/material.dart';
import 'package:tasknotes/presentation/screens/task/list/widgets/item_next_to_do.dart';

import '../../../../../domain/entities/task_entity.dart';

class ListNextToDo extends StatelessWidget {
  const ListNextToDo({
    super.key,
    required this.tasks,
    required this.onItemTap,
  });

  final List<TaskEntity> tasks;
  final Function(TaskEntity) onItemTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ItemNextToDo(
            task: tasks[index],
            onItemTap: onItemTap,
          );
        },
      ),
    );
  }
}
