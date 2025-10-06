import 'package:advansio_test_mobile/widgets/app_inkwell.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: () => Navigator.pop(context),
      child: Image.asset(
        "assets/back_arrow.png",
        height: 18,
        color: Colors.black,
      ),
    );
  }
}
