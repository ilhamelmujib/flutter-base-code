import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tasknotes/app/app_fonts.dart';

import '../../../../app/app_colors.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card.dart';
import '../../../widgets/text.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({super.key, required this.amount});
  final int amount;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      color: AppColors.primary2,
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  "Total your\nfavorite notes",
                ),
                DefaultButton(
                  "View Notes",
                  height: 35,
                  width: null,
                  color: AppColors.black,
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.white,
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.only(top: 15),
                  radius: 12,
                )
              ],
            ),
          ),
          CircularPercentIndicator(
            startAngle: 90,
            radius: 35.0,
            lineWidth: 8.0,
            animation: true,
            percent: 0.7,
            center: DefaultText(
              "$amount",
              size: 30,
              fontFamily: FontFamily.interBold,
            ),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: AppColors.whiteTransparent,
            progressColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}
