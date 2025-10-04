import 'package:advansio_test_mobile/global_variables/constants.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottom;
  final bool extendBodyBehindAppBar;
  final bool safeAreaTop;
  final Color? backGroundColor;
  final PreferredSizeWidget? appBar;
  final double? scaffoldPadding;
  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottom,
    this.backGroundColor,
    this.safeAreaTop = true,
    this.scaffoldPadding,
    this.extendBodyBehindAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: backGroundColor,
        bottomNavigationBar: bottom,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        appBar: appBar,
        body: SafeArea(
          top: safeAreaTop,
          bottom: safeAreaTop,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: scaffoldPadding ?? screenPadding,
            ),
            child: body,
          ),
        ),
      ),
    );
  }
}
