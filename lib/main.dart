import 'dart:io';

import 'package:advansio_test_mobile/global_variables/global_variables.dart';
import 'package:advansio_test_mobile/onboarding.dart';
import 'package:advansio_test_mobile/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(
        context,
      ).copyWith(textScaler: TextScaler.linear(Platform.isIOS ? 1.02 : 1.04)),
      child: MaterialApp(
        theme: appTheme,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessenger,
        debugShowCheckedModeBanner: false,

        home: const Onboarding(),
      ),
    );
  }
}
