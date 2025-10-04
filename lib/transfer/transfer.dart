import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/app_theme.dart';
import 'package:advansio_test_mobile/transfer/bank.dart';
import 'package:advansio_test_mobile/transfer/mobile.dart';
import 'package:advansio_test_mobile/transfer/widgets/transfer_app_bar.dart';
import 'package:advansio_test_mobile/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    void handleTabChange(int newIndex) {
      setState(() {
        currentIndex = newIndex;
      });
    }

    return AppScaffold(
      backGroundColor: currentIndex == 0
          ? appTheme.scaffoldBackgroundColor
          : AppColors.white,
      safeAreaTop: false,
      scaffoldPadding: 0,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          TransferAppBar(
            currentIndex: currentIndex,
            onChanged: handleTabChange,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: currentIndex == 0 ? Mobile() : Bank(),
            ),
          ),
        ],
      ),
    );
  }
}
