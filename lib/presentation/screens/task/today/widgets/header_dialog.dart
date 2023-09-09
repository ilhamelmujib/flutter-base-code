import 'package:flutter/material.dart';
import 'package:tasknotes/app/app_fonts.dart';
import '../../../../../app/app_sources.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/card.dart';
import '../../../../widgets/image.dart';
import '../../../../widgets/text.dart';

class HeaderDialog extends StatelessWidget {
  const HeaderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const DefaultCard(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              child: DefaultText(
                "🎯 Today's Task",
                size: 18,
                fontFamily: FontFamily.interBold,
              )),
          CircleButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageSvg(
                AppSources.icon("ic_close.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
