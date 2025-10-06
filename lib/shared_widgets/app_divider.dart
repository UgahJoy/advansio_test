import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double? topMargin;
  final double? bottomMargin;
  const AppDivider({super.key, this.bottomMargin, this.topMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin ?? 24, top: topMargin ?? 0),
      height: 1.5,
      color: AppColors.grey.withValues(alpha: 0.2),
    );
  }
}
