import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/shared_widgets/app_inkwell.dart';
import 'package:flutter/material.dart';

class TabSelectors extends StatelessWidget {
  final String image;
  final String text;
  final Function() onTap;
  final int index;
  final int currentIndex;

  const TabSelectors({
    super.key,
    required this.text,
    required this.onTap,
    required this.index,
    required this.currentIndex,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: index == currentIndex
                  ? AppColors.white
                  : AppColors.darkPrimaryColor,
              borderRadius: BorderRadius.circular(19),
            ),
            child: Center(
              child: Image.asset(
                image,
                height: 17,
                color: index == currentIndex
                    ? AppColors.primaryColor
                    : AppColors.white,
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
