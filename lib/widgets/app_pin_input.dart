// ignore_for_file: deprecated_member_use

import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:new_pinput/new_pinput.dart';

class AppPinFiled extends StatefulWidget {
  final Function(String) onChanged;
  final Function(String) onCompleted;
  final int? plinLength;
  final TextEditingController controller;
  const AppPinFiled({
    super.key,
    this.plinLength,
    required this.onChanged,
    required this.onCompleted,
    required this.controller,
  });

  @override
  State<AppPinFiled> createState() => _AppPinFiled2State();
}

class _AppPinFiled2State extends State<AppPinFiled> {
  @override
  Widget build(BuildContext context) {
    var enableTheme = PinTheme(
      margin: const EdgeInsets.all(4),
      width: 52,
      height: 52,
      textStyle: header.copyWith(
        fontSize: 24,
        color: AppColors.blue,
        fontWeight: FontWeight.w700,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.transparent),
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
      ),
    );
    return Pinput(
      controller: widget.controller,
      readOnly: true,

      length: widget.plinLength ?? 4,
      defaultPinTheme: enableTheme,
      focusedPinTheme: enableTheme.copyWith(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.transparent),
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
        ),
      ),
      validator: (s) {
        return null;
      },
      cursor: Container(color: AppColors.blue, width: 2.0, height: 30.0),
      showCursor: true,
      obscureText: true,
      obscuringWidget: Image.asset("assets/hash.png", height: 13),

      onChanged: widget.onChanged,
      onCompleted: widget.onCompleted,
    );
  }
}
//https://www.youtube.com/watch?v=SaJe9fYAvyo&t=30s