import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasknotes/utils/formatter.dart';
import '../../../../../app/app_colors.dart';
import '../../../../../app/app_fonts.dart';
import '../../../../../app/app_sources.dart';
import '../../../../../domain/entities/task_entity.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/card.dart';
import '../../../../widgets/image.dart';
import '../../../../widgets/space.dart';
import '../../../../widgets/text.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
    required this.onItemCheckButton,
    this.topRadius = 0,
    this.bottomRadius = 0,
  });

  final TaskEntity task;
  final double topRadius;
  final double bottomRadius;
  final Function(int, bool) onItemCheckButton;

  @override
  Widget build(BuildContext context) {
    Rx<bool> status = task.status.obs;

    return DefaultCard(
      margin: const EdgeInsets.only(left: 20, right: 20),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(topRadius),
        bottom: Radius.circular(bottomRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (topRadius == 0) const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleButton(
                        onTap: () {
                          onItemCheckButton(task.id, !task.status);
                        },
                        icon: Obx(
                          () => ImageSvg(
                            AppSources.icon(
                              status.value
                                  ? "ic_check_done.svg"
                                  : "ic_check_undone.svg",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
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
                DefaultText(
                  Formatter().distanceToNow(task.time),
                  size: 12,
                  color: (!task.status && Formatter().compareToNow(task.time, format: "yyyy-MM-dd HH:mm:ss") < 0)
                      ? AppColors.red
                      : AppColors.gray,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
