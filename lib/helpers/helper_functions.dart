import 'package:advansio_test_mobile/global_variables/global_variables.dart';
import 'package:advansio_test_mobile/widgets/app_loader.dart';
import 'package:flutter/material.dart';

void showProgress(BuildContext context) {
  showAppDialog(Center(child: AppLoader()));
}

Future<dynamic> showAppDialog(Widget child) async {
  return await showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black.withValues(alpha: 0.7),
    context: navigatorKey.currentContext!,
    builder: (context) => child,
  );
}
