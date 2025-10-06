import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/shared_widgets/app_divider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.green,
                    ),
                  ),
                ),
                Gap(8),
                Expanded(
                  child: ScoreBoard(remark: "700", title: "Credit Score"),
                ),
                ScoreBoard(remark: "Excellent", title: "Remark"),
              ],
            ),
          ),
          AppDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Here are tips on how to improve your credit score to have access to more credit.",
              style: TextStyle(fontSize: 13, color: AppColors.blue),
            ),
          ),
          Gap(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Tell me more",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Gap(24),
        ],
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
        Text(title, style: TextStyle(fontSize: 12)),
        Text(remark, style: subHeaders.copyWith()),
      ],
    );
  }
}
