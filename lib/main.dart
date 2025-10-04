import 'dart:io';
import 'package:advansio_test_mobile/global_variables/global_variables.dart';
import 'package:advansio_test_mobile/onboarding.dart';
import 'package:advansio_test_mobile/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
//  Hive.registerAdapter(UserAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(
        context,
      ).copyWith(textScaler: TextScaler.linear(Platform.isIOS ? 1.02 : 1)),
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
