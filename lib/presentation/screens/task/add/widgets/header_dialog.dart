import 'package:flutter/material.dart';
import '../../../../../app/app_sources.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/image.dart';

class HeaderDialog extends StatelessWidget {
  const HeaderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
