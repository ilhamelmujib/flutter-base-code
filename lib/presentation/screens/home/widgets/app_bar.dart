import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasknotes/app/app_fonts.dart';
import '../../../../app/app_colors.dart';
import '../../../../app/app_sources.dart';
import '../../../widgets/button.dart';
import '../../../widgets/image.dart';
import '../../../widgets/text.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({
    super.key,
    required this.onClickProfile,
    required this.onClickSearch,
  });

  final Function() onClickProfile;
  final Function() onClickSearch;
  final box = GetStorage();

  @override
  Color? get backgroundColor => AppColors.background;

  @override
  double? get leadingWidth => 65;

  @override
  Widget? get leading => GestureDetector(
        onTap: onClickProfile,
        child: Row(
          children: [
            const SizedBox(width: 20),
            CircleImage(
              width: 45,
              height: 45,
              fit: BoxFit.cover,
              imageUrl: box.read("photo"),
            ),
          ],
        ),
      );

  @override
  Widget? get title => GestureDetector(
        onTap: onClickProfile,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DefaultText("Halo,"),
            DefaultText(
              box.read("name"),
              size: 18,
              fontFamily: FontFamily.interBold,
            ),
          ],
        ),
      );

  @override
  List<Widget>? get actions => [
        CircleButton(
          onTap: onClickSearch,
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageSvg(
              AppSources.icon("ic_search.svg"),
            ),
          ),
        ),
        const SizedBox(width: 18),
      ];
}
