import 'package:flutter/material.dart';
import 'package:tasknotes/presentation/screens/notes/favorite/widgets/header_dialog.dart';
import 'package:tasknotes/presentation/screens/notes/favorite/widgets/notes_item.dart';

import '../../../../domain/entities/notes_entity.dart';

class FavoriteNotesDialog extends StatelessWidget {
  const FavoriteNotesDialog({super.key, required this.scrollController, required this.notes});

  final ScrollController scrollController;
  final List<NotesEntity> notes;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        const HeaderDialog(),
        for (int index = 0; index < notes.length; index++)
          NotesItem(
            notes: notes[index],
            topRadius: index == 0 ? 20 : 0,
            bottomRadius: index == notes.length - 1 ? 20 : 0,
          ),
        const SizedBox(height: 20)
      ],
    );
  }
}

