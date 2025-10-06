import 'package:advansio_test_mobile/global_variables/constants.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/shared_widgets/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VerifciationCard extends StatelessWidget {
  const VerifciationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 100,
            spreadRadius: 0,
            offset: const Offset(0, 30),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenPadding,
          vertical: 28,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "75%",
                  ),
                ),
                Text("7 of 10 completed", style: TextStyle(fontSize: 12)),
              ],
            ),
            Gap(12),
            LinearProgressIndicator(
              value: 0.7,
              minHeight: 8,
              borderRadius: BorderRadius.circular(5.0),
              color: AppColors.indicatorYellow,
              backgroundColor: AppColors.blue.withValues(alpha: 0.2),
            ),
            AppDivider(topMargin: 20),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Image.asset("assets/user.png", height: 17),
                ),
                Gap(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Gap(8),
                      Text(
                        "When you register for an account, we collect personal informmation",
                        style: TextStyle(fontSize: 13, color: AppColors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(12),
          ],
        ),
      ),
    );
  }
}

class ScoreBoard extends StatelessWidget {
  final String title;
  final String remark;
  const ScoreBoard({super.key, required this.remark, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          remark,
        ),
      ],
    );
  }
}
