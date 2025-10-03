import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Agreement extends StatefulWidget {
  final bool isChecked;
  const Agreement({super.key, required this.isChecked});

  @override
  State<Agreement> createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    isTap = widget.isChecked;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: SizedBox(
            height: 26,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  4,
                ), // Adjust the radius for subtle rounding
              ),
              side: BorderSide(width: 1, color: AppColors.grey),
              value: isTap,
              activeColor: AppColors.blue,
              onChanged: (val) {
                setState(() {
                  isTap = val!;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Text(
            "By creating your account you have to agree with our Teams and Conditions.",
          ),
        ),
      ],
    );
  }
}
