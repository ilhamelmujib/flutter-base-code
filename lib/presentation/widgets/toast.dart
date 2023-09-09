import 'package:flutter/material.dart';
import 'package:tasknotes/presentation/widgets/text.dart';

import '../../app/app_fonts.dart';

class Toast {
  static error(BuildContext context, String message) {
    _show(context, message, Colors.red, "Error $message");
  }

  static success(BuildContext context, String message) {
    _show(context, message, Colors.green, "Success $message");
  }


  static _show(BuildContext context, String message, Color backgroundColor, semanticsLabel) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 700),
        content: DefaultText(
          message,
          size: 16,
          fontFamily: FontFamily.interBold,
          color: Colors.white,
          semanticsLabel: semanticsLabel,
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
