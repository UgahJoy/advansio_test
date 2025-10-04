// ignore_for_file: deprecated_member_use

import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  fontFamily: "DM Sans",
  primaryColor: AppColors.white,
  scaffoldBackgroundColor: AppColors.offWhite,
  primarySwatch: const MaterialColor(0xff009BEF, <int, Color>{
    50: AppColors.white,
    100: AppColors.white,
    200: AppColors.white,
    300: AppColors.white,
    400: AppColors.white,
    500: AppColors.white,
    600: AppColors.white,
    700: AppColors.white,
    800: AppColors.white,
    900: AppColors.white,
  }),
  brightness: Brightness.light,
  useMaterial3: false,

  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.blue.withValues(alpha: 0.8),
      fontWeight: FontWeight.w400,

      fontSize: 15,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      alignment: Alignment.center,
      backgroundColor: AppColors.red,
      textStyle: TextStyle(
        fontSize: 15,
        fontFamily: "DM Sans",
        color: AppColors.white,
        fontWeight: FontWeight.w700,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      minimumSize: const Size(double.infinity, 50),
      foregroundColor: AppColors.white,
      shadowColor: AppColors.transparent,
      surfaceTintColor: AppColors.transparent,
    ),
  ),
);
