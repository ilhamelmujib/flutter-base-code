import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasknotes/app/app_fonts.dart';
import 'package:tasknotes/presentation/widgets/space.dart';
import 'package:tasknotes/utils/formatter.dart';
import '../../../../../app/app_colors.dart';
import '../../../../../domain/entities/task_entity.dart';
import '../../../../widgets/card.dart';
import '../../../../widgets/text.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
    required this.onItemTap,
  });

  final TaskEntity task;
  final Function(TaskEntity) onItemTap;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: InkWell(
        onTap: () {
          onItemTap(task);
        },
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (task.time.year != 0)
                DefaultText(
                  Formatter().distanceToNow(task.time),
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
