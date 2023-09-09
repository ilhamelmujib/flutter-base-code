import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final double marginBottom;
  final Color? backgroundColor;

  const DefaultScaffold(
      {super.key,
      this.appBar,
      required this.body,
      this.bottomNavigationBar = const SizedBox(),
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.marginBottom = 10,
      this.backgroundColor = AppColors.background,
      });

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      backgroundColor: backgroundColor,
    );
  }
}
