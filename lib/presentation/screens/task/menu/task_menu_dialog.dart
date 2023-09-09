import 'package:flutter/material.dart';
import 'package:tasknotes/app/app_colors.dart';
import 'package:tasknotes/presentation/screens/task/menu/widgets/menu_item.dart';
import 'package:tasknotes/presentation/screens/task/menu/widgets/header_dialog.dart';

class TaskMenuDialog extends StatelessWidget {
  const TaskMenuDialog({
    super.key,
    required this.scrollController,
    required this.onSelect,
  });

  final ScrollController scrollController;
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
          text: "Done",
          icon: "ic_done_menu.svg",
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
