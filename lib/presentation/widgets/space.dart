import 'package:flutter/material.dart';

class SpaceColumn extends StatelessWidget {
  final double height;

  const SpaceColumn(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class SpaceRow extends StatelessWidget {
  final double width;

  const SpaceRow(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}