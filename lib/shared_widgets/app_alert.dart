import 'package:advansio_test_mobile/global_variables/global_variables.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class AppAlerts {
  static void showSuccess(String message) {
    if (message.isEmpty) return;
    Flushbar(
        animationDuration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        borderRadius: BorderRadius.circular(8),
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        isDismissible: true,
        borderColor: const Color(0xff48C1B5),
        backgroundColor: const Color(0xffF6FFF9),
        borderWidth: 1,
        flushbarPosition: FlushbarPosition.TOP,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.easeOut,
        titleText: Row(
          children: [
            Image.asset(
              "assets/success_icon.png",
              height: 16,
            ),
            const Gap(8),
            Text("Success",
                style: header.copyWith(
                    height: 0,
                    color: AppColors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        messageText: Row(
          children: [
            const Gap(32),
            Expanded(
              child: Text(
                toBeginningOfSentenceCase(message) ?? '',
                style: header.copyWith(
                    height: 0,
                    color: AppColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        )).show(navigatorKey.currentContext!);
  }

  static void showInfo() {}

  static void showError(String message) {
    if (message.isEmpty) return;
    Flushbar(
      animationDuration: const Duration(milliseconds: 1000),
      borderRadius: BorderRadius.circular(8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      isDismissible: true,
      borderColor: const Color(0xffF4B0A1),
      backgroundColor: const Color(0xffFFF5F3),
      borderWidth: 1,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.easeOut,
      titleText: Row(
        children: [
          Image.asset(
            "assets/error_icon.png",
            height: 16,
          ),
          const Gap(8),
          Text("Error",
              style: header.copyWith(
                  height: 0,
                  color: AppColors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
        ],
      ),
      messageText: Row(
        children: [
          const Gap(32),
          Expanded(
            child: Text(
              toBeginningOfSentenceCase(message) ?? '',
              style: header.copyWith(
                  height: 0,
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    ).show(navigatorKey.currentContext!);
  }
}
