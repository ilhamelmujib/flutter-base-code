import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tasknotes/app/app_sources.dart';
import 'package:tasknotes/presentation/screens/task/add/widgets/app_bar.dart';
import 'package:tasknotes/presentation/screens/task/add/widgets/repetition_dialog.dart';
import 'package:tasknotes/presentation/widgets/image.dart';
import 'package:tasknotes/utils/formatter.dart';
import '../../../../app/app_colors.dart';
import '../../../../app/app_constants.dart';
import '../../../widgets/card.dart';
import '../../../widgets/form.dart';
import '../../../widgets/scaffold.dart';
import '../../../widgets/space.dart';
import '../../../widgets/text.dart';
import 'add_task_controller.dart';

class AddTaskScreen extends GetView<AddTaskController> {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: TaskAppBar(context, controller),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DefaultCard(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DefaultForm(
                controller: controller.notesFormKey,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SpaceColumn(5),
                  DefaultTextFormField(
                    controller: controller.titleController,
                    hint: "Title",
                    mFocusNode: controller.nodeTitle,
                    nextFocus: controller.nodeNotes,
                    textCapitalization: TextCapitalization.words,
                    isBordered: false,
                  ),
                  const SpaceColumn(5),
                  const Divider(),
                  DefaultTextFormField(
                    controller: controller.notesController,
                    hint: "Notes",
                    mFocusNode: controller.nodeNotes,
                    textInputType: TextInputType.multiline,
                    isBordered: false,
                  ),
                  const SpaceColumn(15)
                ],
              ),
            ),
            Obx(
              () => DefaultCard(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (controller.isSwitchDate.value) {
                          controller.isShowCalendar.value =
                              !controller.isShowCalendar.value;
                          controller.isShowTimePicker.value = false;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const DefaultText(
                                "🗓   Date",
                                size: 18,
                              ),
                              if (controller.isSwitchDate.value)
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 45.h, top: 2.h),
                                  child: DefaultText(
                                    Formatter().dateToString(
                                      controller.focusedDay.value,
                                      format: "d MMM yyyy",
                                    ),
                                    size: 14,
                                    color: AppColors.gray,
                                  ),
                                ),
                            ],
                          ),
                          Switch(
                            value: controller.isSwitchDate.value,
                            activeTrackColor: AppColors.primary,
                            activeColor: AppColors.primary,
                            onChanged: (bool value) {
                              FocusScope.of(context).unfocus();
                              controller.isSwitchDate.value = value;
                              controller.isShowCalendar.value = value;
                              controller.isShowTimePicker.value = false;
                              if (!value) controller.isSwitchTime.value = false;
                            },
                          ),
                        ],
                      ),
                    ),
                    if (controller.isShowCalendar.value)
                      TableCalendar(
                        headerStyle: const HeaderStyle(titleCentered: true),
                        calendarStyle: const CalendarStyle(
                          todayDecoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          todayTextStyle: TextStyle(
                            color: AppColors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        firstDay:
                            DateTime.now().subtract(const Duration(days: 30)),
                        lastDay: DateTime.utc(2030, 01, 01),
                        currentDay: controller.focusedDay.value,
                        focusedDay: controller.focusedDay.value,
                        rangeSelectionMode: RangeSelectionMode.disabled,
                        availableCalendarFormats: const {
                          CalendarFormat.month: 'Month'
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          controller.focusedDay.value = focusedDay;
                        },
                      ),
                    SpaceColumn(
                      5.h,
                    ),
                    const Divider(),
                    SpaceColumn(5.h),
                    GestureDetector(
                      onTap: () {
                        if (controller.isSwitchTime.value) {
                          controller.isShowCalendar.value = false;
                          controller.isShowTimePicker.value =
                              !controller.isShowTimePicker.value;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const DefaultText(
                                "⏰   Time",
                                size: 18,
                              ),
                              if (controller.isSwitchTime.value)
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 50.h, top: 2.h),
                                  child: DefaultText(
                                    Formatter().dateToString(
                                      controller.focusedTime.value,
                                      format: "HH:mm",
                                    ),
                                    size: 14,
                                    color: AppColors.gray,
                                  ),
                                ),
                            ],
                          ),
                          Switch(
                            value: controller.isSwitchTime.value,
                            activeTrackColor: AppColors.primary,
                            activeColor: AppColors.primary,
                            onChanged: (bool value) {
                              FocusScope.of(context).unfocus();
                              controller.isSwitchTime.value = value;
                              if (!value) {
                                controller.isShowCalendar.value = true;
                                controller.isShowTimePicker.value = !value;
                              } else {
                                controller.isSwitchDate.value = value;
                                controller.isShowCalendar.value = false;
                                controller.isShowTimePicker.value = value;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    if (controller.isShowTimePicker.value)
                      TimePickerSpinner(
                        time: controller.focusedTime.value,
                        is24HourMode: true,
                        normalTextStyle: const TextStyle(
                          fontSize: 18,
                          color: AppColors.gray,
                        ),
                        highlightedTextStyle: const TextStyle(
                          fontSize: 24,
                          color: AppColors.black,
                        ),
                        spacing: 30,
                        itemHeight: 45,
                        alignment: Alignment.center,
                        isForce2Digits: true,
                        onTimeChange: (time) {
                          controller.focusedTime.value = time;
                        },
                      ),
                  ],
                ),
              ),
            ),
            Obx(
              () => controller.isSwitchDate.value
                  ? DefaultCard(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Future.delayed(
                            const Duration(milliseconds: 500),
                          ).then((value) {
                            showFlexibleBottomSheet(
                              initHeight: 0.54,
                              maxHeight: 0.54,
                              context: context,
                              isExpand: false,
                              bottomSheetColor: Colors.transparent,
                              builder: (
                                BuildContext context,
                                ScrollController scrollController,
                                double offset,
                              ) {
                                return RepetitionDialog(
                                  scrollController: scrollController,
                                  repetitions: repetitions,
                                  selectedRepetition:
                                      controller.selectedRepetition.value,
                                  onSelected: (index) {
                                    controller.selectedRepetition.value = index;
                                  },
                                );
                              },
                            );
                          });
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const DefaultText(
                                "🔁   Repeat",
                                size: 18,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => DefaultText(
                                      repetitions[
                                          controller.selectedRepetition.value],
                                      color: AppColors.gray,
                                    ),
                                  ),
                                  SpaceRow(10.h),
                                  ImageSvg(
                                    AppSources.icon("ic_forward.svg"),
                                    color: AppColors.gray,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SpaceColumn(0),
            ),
          ],
        ),
      ),
    );
  }
}
