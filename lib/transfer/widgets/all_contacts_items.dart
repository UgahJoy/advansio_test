import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/widgets/app_divider.dart';
import 'package:advansio_test_mobile/widgets/app_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchBeneficiaries extends StatelessWidget {
  final String image;
  final String name;
  final bool isLast;
  final String phoneNumber;
  const SearchBeneficiaries({
    super.key,
    required this.image,
    required this.name,
    this.isLast = true,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Gap(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.blue,
                    ),
                  ),
                  Gap(4),
                  Text(
                    phoneNumber,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.phoneNumberGrey,
                    ),
                  ),
                ],
              ),
            ),
            if (isLast) ...[
              AppInkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 35,
                  decoration: BoxDecoration(
                    color: AppColors.phoneNumberGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "Invite",
                      style: TextStyle(fontSize: 12, color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
        AppDivider(topMargin: 12, bottomMargin: 12),
      ],
    );
  }
}
