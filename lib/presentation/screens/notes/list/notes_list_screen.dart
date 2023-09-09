import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasknotes/domain/entities/notes_entity.dart';
import 'package:tasknotes/presentation/screens/notes/list/notes_list_controller.dart';
import 'package:tasknotes/presentation/screens/notes/list/widgets/add_new.dart';
import 'package:tasknotes/presentation/widgets/space.dart';
import '../../../../app/app_fonts.dart';
import '../../../../utils/formatter.dart';
import '../../../widgets/text.dart';
import 'widgets/notes_item.dart';

class NotesListScreen extends GetView<NotesListController> {
  const NotesListScreen({
    super.key,
    required this.onClickAdd,
    required this.onItemTap,
  });

  final Function() onClickAdd;
  final Function(NotesEntity) onItemTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AddNew(onClickAdd: onClickAdd),
          const SpaceColumn(20),
          Obx(() {
            List<GroupedNotes> groupedNotes =
                groupNotesByTime(controller.notes.value);
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: groupedNotes.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: DefaultText(
                          groupedNotes[index].title.isNotEmpty ? groupedNotes[index].title : "Previous Days",
                          size: 20,
                          fontFamily: FontFamily.interBold,
                        ),
                      ),
                      Column(
                        children: groupedNotes[index].notes.map((notes) {
                          return NotesItem(
                            notes: notes,
                            time: Formatter().dateToString(notes.updatedAt, format: groupedNotes[index].title.isEmpty ? "dd MMM yyyy" : "HH:mm"),
                            onItemTap: (notes) {
                              onItemTap(notes);
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  );
                });
          }),
        ],
      ),
    );
  }
}

class GroupedNotes {
  final String title;
  final List<NotesEntity> notes;

  GroupedNotes({required this.title, required this.notes});
}

List<GroupedNotes> groupNotesByTime(List<NotesEntity> notes) {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime yesterday = today.subtract(const Duration(days: 1));
  DateTime lastWeek = today.subtract(const Duration(days: 7));

  List<GroupedNotes> groupedNotes = [];

  List<NotesEntity> todayNotes = [];
  List<NotesEntity> yesterdayNotes = [];
  List<NotesEntity> lastWeekNotes = [];
  List<NotesEntity> otherNotes = [];

  for (var note in notes) {
    if (note.updatedAt.isAfter(today)) {
      todayNotes.add(note);
    } else if (note.updatedAt.isAfter(yesterday)) {
      yesterdayNotes.add(note);
    } else if (note.updatedAt.isAfter(lastWeek)) {
      lastWeekNotes.add(note);
    } else {
      otherNotes.add(note);
    }
  }

  if (todayNotes.isNotEmpty) {
    groupedNotes.add(GroupedNotes(title: "Today", notes: todayNotes));
  }
  if (yesterdayNotes.isNotEmpty) {
    groupedNotes.add(GroupedNotes(title: "Yesterday", notes: yesterdayNotes));
  }
  if (lastWeekNotes.isNotEmpty) {
    groupedNotes.add(GroupedNotes(title: "Last Week", notes: lastWeekNotes));
  }
  if (otherNotes.isNotEmpty) {
    groupedNotes.add(GroupedNotes(title: "", notes: otherNotes));
  }

  return groupedNotes;
}
