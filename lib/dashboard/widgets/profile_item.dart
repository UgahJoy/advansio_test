import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(context.deviceHeight * 0.04),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "N170,425",
                    style: header.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(
                    top: context.deviceHeight * 0.04,
                  ),
                  child: Image.asset("assets/profile_image.png", height: 50),
                ),
              ],
            ),
            Text(
              "Available Credit",
              style: TextStyle(
                color: AppColors.white.withValues(alpha: 0.8),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
