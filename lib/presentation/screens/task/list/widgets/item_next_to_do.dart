import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasknotes/app/app_constants.dart';
import 'package:tasknotes/presentation/widgets/space.dart';

import '../../../../../app/app_colors.dart';
import '../../../../../app/app_fonts.dart';
import '../../../../../domain/entities/task_entity.dart';
import '../../../../../utils/formatter.dart';
import '../../../../widgets/card.dart';
import '../../../../widgets/text.dart';

class ItemNextToDo extends StatelessWidget {
  const ItemNextToDo({
    super.key,
    required this.task,
    required this.onItemTap,
  });

  final TaskEntity task;
  final Function(TaskEntity) onItemTap;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      width: MediaQuery.of(context).size.width - 100,
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
      child: InkWell(
        onTap: () {
          onItemTap(task);
        },
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                task.title,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                fontFamily: FontFamily.interSemiBold,
              ),
              SpaceColumn(5.h),
              if (task.notes.isNotEmpty)
                DefaultText(
                  task.notes,
                  size: 14,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: 10),
              DefaultText(
                "${Formatter().distanceToNow(task.time)} ${task.repetition == 0 ? '' : "  •  ${repetitions[task.repetition]}"}",
                size: 12,
                color: AppColors.gray,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
