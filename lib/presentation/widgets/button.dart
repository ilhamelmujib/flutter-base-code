import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasknotes/presentation/widgets/text.dart';

import '../../app/app_colors.dart';
import '../../app/app_fonts.dart';
import 'image.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final double height;
  final double size;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final FontFamily fontFamily;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final String? icon;
  final double radius;

  const DefaultButton(
    this.text, {
    super.key,
    this.onPressed,
    this.width = double.infinity,
    this.height = 60,
    this.size = 16,
    this.color = Colors.white,
    this.backgroundColor = AppColors.primary,
    this.borderColor = AppColors.primary,
    this.fontFamily = FontFamily.interSemiBold,
    this.margin = const EdgeInsets.only(bottom: 5),
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    this.icon,
    this.radius = 100,
    this.isEnable = true,
  });

  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      child: ElevatedButton(
        style: isEnable
            ? ButtonStyle(
                surfaceTintColor: MaterialStateProperty.all(backgroundColor),
                backgroundColor: MaterialStateProperty.all(backgroundColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: BorderSide(
                      style: BorderStyle.solid,
                      color: borderColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                ),
              )
            : ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.gray),
                enableFeedback: true,
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: const BorderSide(
                      style: BorderStyle.solid,
                      color: AppColors.gray,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                ),
              ),
        onPressed: isEnable ? onPressed : null,
        child: icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageSvg(icon!),
                  const SizedBox(
                    width: 10,
                  ),
                  DefaultText(
                    text,
                    color: color,
                    fontFamily: fontFamily,
                  ),
                ],
              )
            : DefaultText(
                text,
                color: color,
                fontFamily: fontFamily,
              ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget icon;

  const CircleButton({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: icon,
      ),
    );
  }
}

class CircleImageButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget icon;
  final Color backgroundColor;

  const CircleImageButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.4), //(x,y)
              blurRadius: 1.0,
            ),
          ],
        ),
        child: icon,
      ),
    );
  }
}
