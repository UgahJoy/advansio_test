import 'package:advansio_test_mobile/dashboard/widgets/profile_item.dart';
import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DashboarHeader extends StatelessWidget {
  const DashboarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.deviceHeight * 0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryColor, AppColors.primaryColorGradient],
        ),
      ),
      child: Container(
          color: Colors.black.withValues(alpha: 0.25),
          height: double.infinity,
          width: double.infinity,
          child: ProfileItem()),
    );
  }
}
