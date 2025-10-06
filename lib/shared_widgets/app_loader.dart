import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 60,
        width: 60,
        child: CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          backgroundColor: AppColors.white,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
