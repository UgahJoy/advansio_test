import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:flutter/material.dart';

class Agreement extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?>? onChnaged;
  const Agreement({
    super.key,
    required this.isChecked,
    required this.onChnaged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: SizedBox(
            width: 40,

            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: BorderSide(width: 1, color: AppColors.grey),
              value: isChecked,
              activeColor: AppColors.primaryColor,
              onChanged: onChnaged,
            ),
          ),
        ),
        Expanded(
          child: Text(
            "By creating your account you have to agree with our Teams and Conditions.",
            style: subHeaders.copyWith(
              fontSize: 13,
              color: AppColors.blue.withValues(alpha: 0.8),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
