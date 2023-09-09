import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasknotes/presentation/screens/task/add/widgets/repetition_item.dart';

import 'header_dialog.dart';

class RepetitionDialog extends StatelessWidget {
  const RepetitionDialog(
      {super.key,
      required this.scrollController,
      required this.repetitions,
      required this.selectedRepetition,
      required this.onSelected});

  final ScrollController scrollController;
  final List<String> repetitions;
  final int selectedRepetition;
  final Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        const HeaderDialog(),
        for (int index = 0; index < repetitions.length; index++)
          RepetitionItem(
            onSelected: onSelected,
            index: index,
            item: repetitions[index],
            selected: index == selectedRepetition,
            topRadius: index == 0 ? 20 : 0,
            bottomRadius: index == repetitions.length - 1 ? 20 : 0,
          ),
        const SizedBox(height: 20)
      ],
    );
  }
}
