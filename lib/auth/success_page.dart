import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/widgets/app_button.dart';
import 'package:advansio_test_mobile/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

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
          SizedBox(height: 20),

          Image.asset("assets/thumps_up.png", height: 233),

          Text(
            "Account Created!",
            style: header.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 16),
          Text(
            textAlign: TextAlign.center,
            "Dear user your account has been created successfully. Continue to start using app",
          ),

          AppButton(onPressed: () {}, instrcuction: "Continue"),
        ],
      ),
    );
  }
}
