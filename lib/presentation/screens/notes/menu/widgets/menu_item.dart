import 'package:flutter/material.dart';
import '../../../../../app/app_colors.dart';
import '../../../../../app/app_fonts.dart';
import '../../../../../app/app_sources.dart';
import '../../../../widgets/card.dart';
import '../../../../widgets/image.dart';
import '../../../../widgets/text.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.index,
    required this.text,
    required this.icon,
    required this.onSelect,
    this.color = AppColors.black,
    this.topRadius = 0,
    this.bottomRadius = 0,
  });

  final int index;
  final String text;
  final String icon;
  final Color color;
  final double topRadius;
  final double bottomRadius;
  final Function(int) onSelect;

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
          onSelect(index);
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultText(
                    text,
                    color: color,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontFamily: FontFamily.interSemiBold,
                  ),
                  ImageSvg(
                    AppSources.icon(icon),
                    color: color,
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
