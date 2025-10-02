// ignore_for_file: deprecated_member_use

import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  fontFamily: "DM Sans",
  primaryColor: AppColors.white,
  scaffoldBackgroundColor: AppColors.white,
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
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.grey,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
  ),

  //elevatedButtonTheme:
);
