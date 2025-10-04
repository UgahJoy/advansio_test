import 'package:advansio_test_mobile/global_variables/global_variables.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:flutter/material.dart';

class App {
  const App._();
  static TextStyle header({
    bool? inherit,
    Color color = AppColors.blue,
    Color? backgroundColor,
    double fontSize = 30,
    FontWeight fontWeight = FontWeight.w700,
    FontStyle? fontStyle,
    double letterSpacing = 0,
    double? wordSpacing,
    double height = 2.86,
    Locale? locale,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? fontFamily,
    TextOverflow? overflow,
  }) =>
      Theme.of(navigatorKey.currentState!.context)
          .textTheme
          .titleMedium!
          .copyWith(
            color: color,
            fontWeight: fontWeight,
            inherit: inherit,
            height: height,
            backgroundColor: backgroundColor,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            locale: locale,
            decorationStyle: decorationStyle,
            decorationThickness: decorationThickness,
            fontFamily: fontFamily,
            overflow: overflow,
          );

  static TextStyle subHeaders({
    bool? inherit,
    Color color = AppColors.blue,
    Color? backgroundColor,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w700,
    FontStyle? fontStyle,
    double letterSpacing = 0,
    double? wordSpacing,
    double? height,
    Locale? locale,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? fontFamily,
    TextOverflow? overflow,
  }) =>
      Theme.of(navigatorKey.currentState!.context)
          .textTheme
          .bodyMedium!
          .copyWith(
            fontWeight: fontWeight,
            color: color,
            inherit: inherit,
            height: height,
            backgroundColor: backgroundColor,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
            locale: locale,
            decorationStyle: decorationStyle,
            decorationThickness: decorationThickness,
            fontFamily: fontFamily,
            overflow: overflow,
          );
}

TextStyle header = App.header();
TextStyle subHeaders = App.subHeaders();
