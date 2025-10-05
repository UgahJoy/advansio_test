import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/widgets/app_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActivityActionItems extends StatelessWidget {
  final String image;
  final Function() onTap;
  final Color color;
  final String text;
  final double? imageHeight;
  final bool isLast;
  const ActivityActionItems({
    super.key,
    required this.color,
    required this.image,
    this.imageHeight,
    this.isLast = true,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Container(
          width: 107,
          margin: EdgeInsets.only(right: 8),
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (isLast) ...[
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 12,
                  spreadRadius: 0,
                  offset: const Offset(10, 0),
                ),
              ],
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(image, height: imageHeight ?? 12),
                ),
              ),
              Gap(10),
              Text(text, style: TextStyle(fontSize: 13, color: AppColors.blue)),
            ],
          ),
        ),
      ),
    );
  }
}
