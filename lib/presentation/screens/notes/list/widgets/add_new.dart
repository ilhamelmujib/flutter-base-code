import 'package:flutter/material.dart';

import '../../../../../app/app_colors.dart';
import '../../../../../app/app_fonts.dart';
import '../../../../../app/app_sources.dart';
import '../../../../widgets/card.dart';
import '../../../../widgets/image.dart';
import '../../../../widgets/text.dart';

class AddNew extends StatelessWidget{
  const AddNew({super.key, required this.onClickAdd});

  final Function() onClickAdd;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onClickAdd,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.primary2),
                padding: const EdgeInsets.all(12),
                child: ImageSvg(
                  AppSources.icon("ic_plus.svg"),
                ),
              ),
              const SizedBox(width: 20),
              const DefaultText(
                "Add new notes",
                size: 18,
                fontFamily: FontFamily.interSemiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }

}