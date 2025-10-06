import 'package:advansio_test_mobile/global_variables/global_variables.dart';
import 'package:flutter/material.dart';

String? currentRoute;

class AppRouter {
  static replaceWith(Widget route, {isDialog = false, String? routeName}) {
    currentRoute = route.runtimeType.toString();
    return navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(
        fullscreenDialog: isDialog,
        builder: (context) => route,
      ),
    );
  }

  static navigateTo(Widget route, {isDialog = false}) async {
    currentRoute = route.runtimeType.toString();

    return await navigatorKey.currentState!.push(
      MaterialPageRoute(
        settings: RouteSettings(name: currentRoute),
        fullscreenDialog: isDialog,
        builder: (context) => route,
      ),
    );
  }

  static clearAllAndPush(Widget route, {isDialog = false, String? routeName}) {
    currentRoute = route.runtimeType.toString();
    return navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          fullscreenDialog: isDialog,
          builder: (context) => route,
        ),
        (Route<dynamic> r) => false);
  }
}
