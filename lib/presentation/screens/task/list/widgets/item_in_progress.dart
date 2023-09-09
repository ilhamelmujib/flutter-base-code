import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasknotes/app/app_fonts.dart';
import 'package:tasknotes/presentation/widgets/space.dart';
import 'package:tasknotes/utils/formatter.dart';

import '../../../../../app/app_colors.dart';
import '../../../../../app/app_sources.dart';
import '../../../../../domain/entities/task_entity.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/card.dart';
import '../../../../widgets/image.dart';
import '../../../../widgets/text.dart';

class ItemInProgress extends StatelessWidget {
  const ItemInProgress({
    super.key,
    required this.task,
    required this.onItemCheckButton,
    required this.onItemTap,
  });

  final TaskEntity task;
  final Function(int, bool) onItemCheckButton;
  final Function(TaskEntity) onItemTap;

  @override
  Widget build(BuildContext context) {
    Rx<bool> status = task.status.obs;
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
                    CircleButton(
                      onTap: () async {
                        status.value = !status.value;
                        await Future.delayed(const Duration(milliseconds: 300));
                        onItemCheckButton(task.id, status.value);
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
              if (task.time.year != 0)
                DefaultText(
                  Formatter().distanceToNow(task.time),
                  size: 12,
                  color: Formatter().compareToNow(task.time,
                              format: "yyyy-MM-dd HH:mm:ss") <
                          0
                      ? AppColors.red
                      : AppColors.gray,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
