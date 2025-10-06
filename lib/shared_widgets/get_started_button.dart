import 'package:advansio_test_mobile/auth/sign_up.dart';
import 'package:advansio_test_mobile/global_variables/constants.dart';
import 'package:advansio_test_mobile/helpers/app_router.dart';
import 'package:advansio_test_mobile/storage/local_storage.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        LocalStorage.storeData(key: LocalStorage.firstTimer, value: "true");
        AppRouter.replaceWith(SignUp());
      },
      child: Center(
        child: Container(
          height: 60,
          width: 227,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white.withValues(alpha: 0.9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Get Started",
                style: subHeaders.copyWith(
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(width: mediumSpaceBetween),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColors.red2,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset("assets/forward_arrow.png", height: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
