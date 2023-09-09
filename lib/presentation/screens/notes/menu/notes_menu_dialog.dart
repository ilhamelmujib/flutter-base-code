import 'package:flutter/material.dart';
import 'package:tasknotes/app/app_colors.dart';
import 'package:tasknotes/domain/entities/notes_entity.dart';
import 'package:tasknotes/presentation/screens/task/menu/widgets/menu_item.dart';
import 'package:tasknotes/presentation/screens/task/menu/widgets/header_dialog.dart';

class NotesMenuDialog extends StatelessWidget {
  const NotesMenuDialog({
    super.key,
    required this.scrollController,
    required this.notes,
    required this.onSelect,
  });

  final ScrollController scrollController;
  final NotesEntity notes;
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        const HeaderDialog(),
        MenuItem(
          onSelect: onSelect,
          index: 0,
          text: notes.isFavorite ? "Unfavorite" : "Favorite",
          icon: notes.isFavorite ? "ic_favorite.svg" : "ic_unfavorite.svg",
          topRadius: 20,
          bottomRadius: 0,
        ),
        MenuItem(
          onSelect: onSelect,
          index: 1,
          text: "Edit",
          icon: "ic_edit_menu.svg",
          topRadius: 0,
          bottomRadius: 0,
        ),
        MenuItem(
          onSelect: onSelect,
          index: 2,
          text: "Delete",
          icon: "ic_delete_menu.svg",
          topRadius: 0,
          bottomRadius: 20,
          color: AppColors.red,
        ),
      ],
    );
  }
}
