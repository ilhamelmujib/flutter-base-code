import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  const DefaultCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.color = Colors.white,
    this.margin,
    this.padding,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(20),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: Material(
        color: color,
        borderRadius: borderRadius,
        child: Container(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
