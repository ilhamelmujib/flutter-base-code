import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:card_slider/card_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasknotes/app/app_pages.dart';
import 'package:tasknotes/presentation/screens/home/home_controller.dart';
import 'package:tasknotes/presentation/screens/home/widgets/app_bar.dart';
import 'package:tasknotes/presentation/screens/home/widgets/notes_card.dart';
import 'package:tasknotes/presentation/screens/notes/list/notes_list_controller.dart';
import 'package:tasknotes/presentation/screens/notes/list/notes_list_screen.dart';
import 'package:tasknotes/presentation/screens/home/widgets/profile_dialog.dart';
import 'package:tasknotes/presentation/screens/home/widgets/task_card.dart';
import 'package:tasknotes/presentation/screens/notes/menu/notes_menu_dialog.dart';
import 'package:tasknotes/presentation/screens/task/list/task_list_controller.dart';
import 'package:tasknotes/presentation/screens/task/menu/task_menu_dialog.dart';
import 'package:tasknotes/presentation/widgets/toast.dart';
import '../../../app/app_colors.dart';
import '../../widgets/scaffold.dart';
import '../notes/favorite/favorite_notes_dialog.dart';
import '../task/list/task_list_screen.dart';
import '../task/today/task_today_controller.dart';
import '../task/today/task_today_dialog.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  final taskListController = Get.find<TaskListController>();
  final taskTodayController = Get.find<TaskTodayController>();
  final notesListController = Get.find<NotesListController>();
  final notesFavoriteController = Get.find<NotesListController>();

  @override
  Widget build(BuildContext context) {
    final List<Widget> cards = [
      Obx(
        () => TaskCard(
          percentage: controller.percentageTask.value,
        ),
      ),
      Obx(
        () => NotesCard(
          amount: controller.favoriteNotes.value,
        ),
      ),
    ];

    return DefaultScaffold(
      appBar: HomeAppBar(
        onClickProfile: () {
          showProfileDialog(context);
        },
        onClickSearch: (){
          if(controller.slideIndex.value == 1){
            Get.toNamed(Routes.taskSearch);
          }else{
            Get.toNamed(Routes.notesSearch);
          }
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                if (controller.slideIndex.value == 1) {
                  if(taskTodayController.tasks.isEmpty){
                    Toast.error(context, "No data!");
                    return;
                  }

                  showFlexibleBottomSheet(
                    minHeight: 0.2,
                    maxHeight: 1,
                    context: context,
                    bottomSheetColor: Colors.transparent,
                    builder: (
                      BuildContext context,
                      ScrollController scrollController,
                      double offset,
                    ) {
                      return Obx(
                        () => TaskTodayDialog(
                          scrollController: scrollController,
                          tasks: taskTodayController.tasks.value,
                          onItemCheckButton: (id, status) async {
                            await controller.updateStatusTask(id, status);
                            await controller.fetchTask();
                            await taskListController.fetchTask();
                            await taskTodayController.fetchTask();
                          },
                        ),
                      );
                    },
                    anchors: [
                      0,
                      0.5,
                      0.99,
                    ],
                  );
                } else {
                  if(notesFavoriteController.notes.isEmpty){
                    Toast.error(context, "No data!");
                    return;
                  }

                  showFlexibleBottomSheet(
                    minHeight: 0.2,
                    maxHeight: 1,
                    context: context,
                    bottomSheetColor: Colors.transparent,
                    builder: (
                      BuildContext context,
                      ScrollController scrollController,
                      double offset,
                    ) {
                      return Obx(
                        () => FavoriteNotesDialog(
                          scrollController: scrollController,
                          notes: notesFavoriteController.notes.value,
                        ),
                      );
                    },
                    anchors: [
                      0,
                      0.5,
                      0.99,
                    ],
                  );
                }
              },
              child: CardSlider(
                cards: controller.slideIndex.value == 1
                    ? cards
                    : cards.reversed.toList(),
                bottomOffset: .0010,
                cardHeight: 0.40,
                itemDotOffset: 0.5,
                itemDotWidth: 14,
                containerHeight: 250,
                slideChanged: (index) async {
                  var position = (index as int);
                  Future.delayed(Duration.zero, () {
                    controller.slideIndex.value = position;
                  });

                  if (position == 0) {
                    await controller.fetchTask();
                    await taskListController.fetchTask();
                    await taskTodayController.fetchTask();
                  } else {
                    await controller.fetchNotes();
                    await notesListController.fetchNotes();
                    await notesFavoriteController.fetchNotes();
                  }
                },
                itemDot: (itemDotWidth) {
                  return Container(
                    margin: const EdgeInsets.all(3),
                    width: 8 + itemDotWidth,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: itemDotWidth == 0
                          ? AppColors.gray
                          : (controller.slideIndex.value == 1
                              ? AppColors.primary
                              : AppColors.primary2),
                    ),
                  );
                },
              ),
            ),
            Obx(
              () => controller.slideIndex.value == 1
                  ? TaskListScreen(
                      onClickAdd: () async {
                        var result = await Get.toNamed(Routes.taskAdd);
                        if (result != null) {
                          await controller.fetchTask();
                          await taskTodayController.fetchTask();
                          await taskListController.fetchTask();
                        }
                      },
                      onItemCheckButton: (id, status) async {
                        await controller.updateStatusTask(id, status);
                        await controller.fetchTask();
                        await taskTodayController.fetchTask();
                        await taskListController.fetchTask();
                      },
                      onItemTap: (task) {
                        showFlexibleBottomSheet(
                          minHeight: 0.37,
                          initHeight: 0.37,
                          maxHeight: 0.37,
                          context: context,
                          bottomSheetColor: Colors.transparent,
                          builder: (
                            BuildContext context,
                            ScrollController scrollController,
                            double offset,
                          ) {
                            return TaskMenuDialog(
                              scrollController: scrollController,
                              onSelect: (index) async {
                                Navigator.of(context).pop();
                                if (index == 0) {
                                  await controller.updateStatusTask(
                                    task.id,
                                    !task.status,
                                  );
                                  await controller.fetchTask();
                                  taskTodayController.fetchTask();
                                  taskListController.fetchTask();
                                } else if (index == 1) {
                                  final result = await Get.toNamed(
                                      Routes.taskAdd,
                                      arguments: task);
                                  if (result != null) {
                                    await controller.fetchTask();
                                    await taskTodayController.fetchTask();
                                    await taskListController.fetchTask();
                                  }
                                } else {
                                  await controller.deleteTask(task.id);
                                  await controller.fetchTask();
                                  await taskTodayController.fetchTask();
                                  await taskListController.fetchTask();
                                }
                              },
                            );
                          },
                          anchors: [
                            0,
                          ],
                        );
                      },
                    )
                  : NotesListScreen(
                      onClickAdd: () async {
                        final result = await Get.toNamed(Routes.notesAdd);
                        if (result != null) {
                          await controller.fetchNotes();
                          await notesListController.fetchNotes();
                          await notesFavoriteController.fetchNotes();
                        }
                      },
                      onItemTap: (notes) {
                        showFlexibleBottomSheet(
                          minHeight: 0.37,
                          initHeight: 0.37,
                          maxHeight: 0.37,
                          context: context,
                          bottomSheetColor: Colors.transparent,
                          builder: (
                            BuildContext context,
                            ScrollController scrollController,
                            double offset,
                          ) {
                            return NotesMenuDialog(
                              scrollController: scrollController,
                              notes: notes,
                              onSelect: (index) async {
                                Navigator.of(context).pop();
                                if (index == 0) {
                                  await controller.updateFavoriteNotes(
                                    notes.id,
                                    !notes.isFavorite,
                                  );
                                  await controller.fetchNotes();
                                  await notesListController.fetchNotes();
                                  await notesFavoriteController.fetchNotes();
                                } else if (index == 1) {
                                  final result = await Get.toNamed(
                                      Routes.notesAdd,
                                      arguments: notes);
                                  if (result != null) {
                                    await controller.fetchNotes();
                                    await notesListController.fetchNotes();
                                    await notesFavoriteController.fetchNotes();
                                  }
                                } else {
                                  await controller.deleteNotes(notes.id);
                                  await controller.fetchNotes();
                                  await notesListController.fetchNotes();
                                  await notesFavoriteController.fetchNotes();
                                }
                              },
                            );
                          },
                          anchors: [
                            0,
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  showProfileDialog(BuildContext context) {
    showFlexibleBottomSheet(
      context: context,
      bottomSheetColor: Colors.transparent,
      builder: (
        BuildContext context,
        ScrollController scrollController,
        double offset,
      ) {
        return ProfileDialog();
      },
      anchors: [
        0,
      ],
    );
  }
}
