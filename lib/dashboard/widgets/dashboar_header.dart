import 'package:advansio_test_mobile/dashboard/widgets/chart_card.dart';
import 'package:advansio_test_mobile/dashboard/widgets/profile_item.dart';
import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DashboarHeader extends StatelessWidget {
  const DashboarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: context.deviceHeight * 0.4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primaryColor, AppColors.primaryColorGradient],
            ),
          ),
          child: ProfileItem(),
        ),
        Positioned(
          left: 28,
          right: 28,
          top: context.deviceHeight * 0.27,
          child: ChartCard(),
        ),
      ],
    );
  }
}
