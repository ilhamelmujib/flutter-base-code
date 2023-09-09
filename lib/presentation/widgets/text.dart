
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/app_colors.dart';
import '../../../app/app_fonts.dart';
import 'image.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final FontFamily fontFamily;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final String? semanticsLabel;

  const DefaultText(
    this.text, {
    super.key,
    this.size = 16,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = FontFamily.interRegular,
    this.textOverflow,
    this.maxLines,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel ?? text,
      child: Linkify(
        linkifiers: const [
          UrlLinkifier(),
        ],
        onOpen: (link) async {
          final uri = Uri.parse(link.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        text: text,
        maxLines: maxLines,
        textAlign: textAlign,
        overflow: textOverflow,
        style: TextStyle(
          fontFamily: fontFamily.name,
          fontSize: size.sp,
          color: color,
          fontStyle: fontStyle,
          fontWeight: fontWeight,
          overflow: textOverflow,
        ),
        linkStyle: TextStyle(
          fontFamily: fontFamily.name,
          fontSize: size.sp,
          fontWeight: fontWeight,
          color: AppColors.primary,
          fontStyle: fontStyle,
          overflow: textOverflow,
        ),
      ),
    );
  }
}

class DefaultRichText extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String text1, text2;
  final Color colorText1;
  final Color colorText2;
  final double size;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final FontFamily fontFamily;

  const DefaultRichText({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
    this.size = 16,
    this.colorText1 = Colors.black,
    this.colorText2 = AppColors.primary,
    this.textAlign = TextAlign.start,
    this.fontStyle = FontStyle.normal,
    this.fontFamily = FontFamily.interRegular,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          text: text1,
          style: TextStyle(
            fontFamily: fontFamily.name,
            fontSize: size.sp,
            color: colorText1,
            fontStyle: fontStyle,
          ),
          children: [
            TextSpan(
              text: text2,
              style: TextStyle(
                fontFamily: fontFamily.name,
                fontWeight: FontWeight.bold,
                fontSize: size.sp,
                color: colorText2,
                fontStyle: fontStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectionText extends StatelessWidget {
  final Function(dynamic, String) onTap;
  final dynamic value;
  final String text;
  final bool isSelected;

  const SelectionText({
    super.key,
    required this.onTap,
    required this.value,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(value, text),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: DefaultText(
                text,
              ),
            ),
            ImageSvg(isSelected ? 'ic_selected.svg' : 'ic_select.svg')
          ],
        ),
      ),
    );
  }
}
