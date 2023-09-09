import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tasknotes/app/app_colors.dart';
import 'package:tasknotes/app/app_pages.dart';
import 'package:tasknotes/presentation/widgets/card.dart';
import 'package:tasknotes/presentation/widgets/space.dart';
import '../../../../app/app_fonts.dart';
import '../../../../app/app_sources.dart';
import '../../../widgets/button.dart';
import '../../../widgets/image.dart';
import '../../../widgets/text.dart';

class ProfileDialog extends StatelessWidget {
  ProfileDialog({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 100),
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
        ),
        DefaultCard(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              CircleImage(
                width: 45,
                height: 45,
                fit: BoxFit.cover,
                imageUrl: box.read("photo"),
              ),
              const SpaceRow(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    box.read("name"),
                    size: 18,
                    fontFamily: FontFamily.interBold,
                  ),
                  DefaultText(
                    box.read("email"),
                    color: AppColors.gray,
                  ),
                ],
              )
            ],
          ),
        ),
        const SpaceColumn(20),
        DefaultCard(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: () async {
              await GoogleSignIn().signOut();
              await GetStorage().erase();
              await Get.offAllNamed(Routes.sign);
            },
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const DefaultText(
                    "Logout",
                    color: AppColors.red,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontFamily: FontFamily.interSemiBold,
                  ),
                  ImageSvg(
                    AppSources.icon("ic_logout.svg"),
                    color: AppColors.red,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
