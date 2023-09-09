
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/app_colors.dart';
import '../../../app/app_fonts.dart';

class DefaultForm extends StatelessWidget {
  final GlobalKey controller;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  const DefaultForm({
    super.key,
    required this.controller,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      debugLabel: 'Scope',
      autofocus: true,
      child: Form(
        key: controller,
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      ),
    );
  }
}

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final bool isLabeled;
  final ValueChanged<String>? onChanged;
  final FocusNode? mFocusNode;
  final FocusNode? nextFocus;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isBordered;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLines;
  final int? minLines;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Focus(
      debugLabel: 'hint',
      child: Builder(
        builder: (BuildContext context) {
          final FocusNode focusNode = Focus.of(context);
          final bool hasFocus = focusNode.hasFocus;
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: 55.h),
            child: TextFormField(
                autofocus: autofocus,
                maxLines: maxLines,
                minLines: minLines,
                textCapitalization: textCapitalization,
                textAlign: textAlign,
                obscureText: obscureText,
                keyboardType: textInputType,
                textInputAction: textInputAction,
                controller: controller,
                onChanged: onChanged,
                focusNode: mFocusNode,
                readOnly: readOnly,
                onFieldSubmitted: (value) {
                  if (nextFocus != null) {
                    FocusScope.of(context).requestFocus(nextFocus);
                  }
                },
                inputFormatters: inputFormatter,
                decoration: _DefaultInputDecoration(
                  hint: hint,
                  isLabeled: isLabeled,
                  hasFocus: hasFocus,
                  prefIcon: prefixIcon,
                  sufIcon: suffixIcon,
                  isBordered: isBordered,
                )),
          );
        },
      ),
    );
  }

  const DefaultTextFormField({
    super.key,
    this.controller,
    required this.hint,
    this.isLabeled = false,
    this.onChanged,
    this.mFocusNode,
    this.nextFocus,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.prefixIcon,
    this.suffixIcon,
    this.isBordered = true,
    this.readOnly = false,
    this.inputFormatter,
    this.maxLines = 1,
    this.minLines,
    this.autofocus = false,
  });
}

class _DefaultInputDecoration extends InputDecoration {
  final String hint;
  final bool hasFocus;
  final bool isLabeled;
  final Widget? prefIcon;
  final Widget? sufIcon;
  final bool isBordered;

  const _DefaultInputDecoration({
    required this.hint,
    this.hasFocus = false,
    this.isLabeled = false,
    this.prefIcon,
    this.sufIcon,
    this.isBordered = true,
  });

  @override
  TextStyle get hintStyle =>
      TextStyle(fontFamily: FontFamily.interRegular.name, fontSize: 18.sp, color: AppColors.gray);

  @override
  String? get hintText => isLabeled ? null : hint;

  @override
  String? get labelText => isLabeled ? hint : null;

  @override
  TextStyle get labelStyle => TextStyle(
    fontFamily: FontFamily.interRegular.name,
    color: hasFocus ? AppColors.primary : Colors.grey,
    fontSize: 16.sp,
  );

  @override
  InputBorder get enabledBorder => isBordered
      ? const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  )
      : InputBorder.none;

  @override
  InputBorder get disabledBorder => isBordered
      ? const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  )
      : InputBorder.none;

  @override
  InputBorder get focusedBorder => isBordered
      ? const UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.primary),
  )
      : InputBorder.none;

  @override
  InputBorder? get border => isBordered
      ? const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  )
      : InputBorder.none;

  @override
  EdgeInsetsGeometry? get contentPadding =>
      const EdgeInsets.only(top: 11, bottom: 4);

  @override
  Widget? get prefixIcon => prefIcon;

  @override
  BoxConstraints get prefixIconConstraints => BoxConstraints(minWidth: 40.w);

  @override
  Widget? get suffixIcon => sufIcon;

  @override
  BoxConstraints get suffixIconConstraints => BoxConstraints(minWidth: 40.w);

  @override
  bool? get filled => fillColor != null;
}