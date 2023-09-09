import 'package:flutter/material.dart';
import '../../../../../app/app_colors.dart';
import '../../../../../app/app_sources.dart';
import '../../../../widgets/card.dart';
import '../../../../widgets/image.dart';
import '../../../../widgets/text.dart';

class RepetitionItem extends StatelessWidget {
  const RepetitionItem({
    super.key,
    required this.onSelected,
    required this.index,
    required this.item,
    required this.selected,
    this.topRadius = 0,
    this.bottomRadius = 0,
  });

  final Function(int) onSelected;
  final int index;

  final String item;
  final bool selected;

  final double topRadius;
  final double bottomRadius;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      margin: const EdgeInsets.only(left: 20, right: 20),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(topRadius),
        bottom: Radius.circular(bottomRadius),
      ),
      child: InkWell(
        onTap: () {
          onSelected(index);
          Navigator.of(context).pop();
        },
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
                  DefaultText(
                    item,
                  ),
                  if (selected)
                    ImageSvg(
                      AppSources.icon("ic_done.svg"),
                      color: AppColors.primary,
                      width: 14,
                      height: 14,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
