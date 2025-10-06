import 'package:advansio_test_mobile/global_variables/constants.dart';
import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/shared_widgets/app_button.dart';
import 'package:advansio_test_mobile/shared_widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SuccessPage extends StatefulWidget {
  final String message;
  final String title;
  final Function() onPressed;
  const SuccessPage({
    super.key,
    required this.message,
    required this.title,
    required this.onPressed,
  });

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(context.deviceHeight * 0.1),
          Image.asset("assets/thumps_up.png", height: 233),
          Gap(context.deviceHeight * 0.1),
          Text(
            textAlign: TextAlign.center,
            widget.title,
            style: header.copyWith(height: 1.3),
          ),
          Gap(12),
          Text(
            textAlign: TextAlign.center,
            widget.message,
            style: TextStyle(fontSize: 12, height: 1.7),
          ),
          Gap(context.deviceHeight * 0.22),
          AppButton(onPressed: widget.onPressed, instrcuction: "Continue"),
          Gap(screenPadding),
        ],
      ),
    );
  }
}
