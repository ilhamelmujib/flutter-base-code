import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tasknotes/app/app_fonts.dart';
import '../../../../app/app_colors.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card.dart';
import '../../../widgets/text.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.percentage});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      color: AppColors.primary,
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
                  "Your today's task\nalmost done",
                ),
                DefaultButton(
                  "View Task",
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
            radius: 35.0,
            lineWidth: 8.0,
            animation: true,
            percent: (percentage / 100),
            center: DefaultText(
              "${percentage.toStringAsFixed(0)}%",
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
