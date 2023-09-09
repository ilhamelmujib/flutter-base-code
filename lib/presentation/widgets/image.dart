import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:tasknotes/app/app_colors.dart';

import '../../../app/app_sources.dart';

class ImageSvg extends StatelessWidget {
  final String file;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final String? semanticsLabel;

  const ImageSvg(
    this.file, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      child: SvgPicture.asset(
        file,
        width: width,
        height: height,
        fit: fit,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : const ColorFilter.srgbToLinearGamma(),
      ),
    );
  }
}

class ImageFile extends StatelessWidget {
  final String file;
  final double? width;
  final double? height;
  final BoxFit fit;

  const ImageFile(
    this.file, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      file,
      width: width,
      height: height,
      fit: fit,
    );
  }
}

class CircleImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String? imageUrl;
  final BoxFit fit;
  final Widget errorWidget;

  const CircleImage({
    super.key,
    this.width,
    this.height,
    this.imageUrl,
    this.fit = BoxFit.contain,
    this.errorWidget = const Center(
      child: ImageSvg(
        'ic_cloud_warning.svg',
        color: AppColors.gray,
        width: 100,
        height: 100,
      ),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.border,
          width: 2.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(300),
        child: imageUrl == null
            ? errorWidget
            : CachedNetworkImage(
                width: width,
                height: height,
                imageUrl: imageUrl!,
                fit: fit,
                errorWidget: (context, url, error) => errorWidget,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return const CircularProgressIndicator();
                },
              ),
      ),
    );
  }
}

class RectangleImage extends StatelessWidget {
  final double? width;
  final double? height;
  final String? imageUrl;
  final BoxFit fit;
  final double radius;
  final Widget errorWidget;

  const RectangleImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.radius = 0,
    this.errorWidget = const Center(
      child: ImageSvg(
        'ic_cloud_warning.svg',
        color: AppColors.gray,
        width: 100,
        height: 100,
      ),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: imageUrl == null
          ? errorWidget
          : CachedNetworkImage(
              width: width,
              height: height,
              imageUrl: imageUrl!,
              fit: fit,
              errorWidget: (context, url, error) => errorWidget,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Center(
                  child: Lottie.asset(
                    AppSources.raw("loading_image.json"),
                    height: 250,
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
    );
  }
}

class Logo extends StatelessWidget {
  final double? width;
  final double? height;
  final String file;

  const Logo({super.key, this.width, this.height, this.file = 'logo.svg'});

  @override
  Widget build(BuildContext context) {
    return ImageSvg(
      file,
      height: height,
      semanticsLabel: "Logo Hatam",
    );
  }
}

class IconPassword extends StatelessWidget {
  final GestureTapCallback onTap;
  final bool isObscure;

  const IconPassword({
    super.key,
    required this.onTap,
    required this.isObscure,
  });

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
        child: Icon(
          isObscure ? Icons.visibility_off : Icons.visibility,
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? imageUrl;
  final double width;
  final double height;
  final Widget? child;
  final String? semanticsLabel;

  const Avatar({
    super.key,
    this.onTap,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.child,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            imageUrl == null
                ? ImageSvg(
                    'ic_avatar.svg',
                    width: width,
                    height: height,
                    color: AppColors.gray,
                    semanticsLabel: semanticsLabel,
                  )
                : CircleImage(
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                    imageUrl: imageUrl,
                    errorWidget: ImageSvg(
                      'ic_avatar.svg',
                      color: AppColors.gray,
                      semanticsLabel: semanticsLabel,
                    ),
                  ),
            child ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class Crown extends StatelessWidget {
  final double? width;
  final double? height;

  const Crown({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.4), //(x,y)
            blurRadius: 1.0,
          ),
        ],
      ),
      child: const ImageSvg('ic_crown.svg'),
    );
  }
}
