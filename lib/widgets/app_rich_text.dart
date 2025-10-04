import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/widgets/app_inkwell.dart';
import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  final String question;
  final String instruction;
  final Function() onTap;
  const AppRichText({
    super.key,
    required this.instruction,
    required this.question,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: question,
          style: subHeaders.copyWith(
            color: AppColors.blue.withValues(alpha: 0.8),
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(
              text: " $instruction",
              style: subHeaders.copyWith(
                color: AppColors.blue.withValues(alpha: 0.8),
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
