import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasknotes/app/app_fonts.dart';
import 'package:tasknotes/presentation/widgets/space.dart';
import '../../../../../app/app_colors.dart';
import '../../../../../app/app_sources.dart';
import '../../../../../utils/formatter.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/image.dart';
import '../../../../widgets/text.dart';
import '../add_task_controller.dart';

class TaskAppBar extends AppBar {
  TaskAppBar(this.context, this.controller, {super.key});

  final BuildContext context;
  final AddTaskController controller;

  @override
  Color? get backgroundColor => AppColors.background;

  @override
  double? get leadingWidth => 48;

  @override
  Widget? get leading => Row(
        children: [
          const SpaceRow(5),
          CircleButton(
            onTap: () => {Get.back()},
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageSvg(
                AppSources.icon("ic_back.svg"),
              ),
            ),
          ),
        ],
      );

  @override
  Widget? get title => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DefaultText(
            "Task",
            size: 18,
            fontFamily: FontFamily.interBold,
          ),
          DefaultText(
            Formatter()
                .dateToString(DateTime.now(), format: "dd MMM yyyy HH:mm"),
            size: 14,
            color: AppColors.gray,
          ),
        ],
      );

  @override
  List<Widget>? get actions => [
        GestureDetector(
          onTap: () => {
            if(Get.arguments != null){
              controller.updateTask()
            }else{
              controller.addTask()
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 7,
            ),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.primary),
              padding: const EdgeInsets.all(10),
              child: ImageSvg(
                AppSources.icon("ic_done.svg"),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ];
}
