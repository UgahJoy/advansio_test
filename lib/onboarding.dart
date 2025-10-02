import 'package:advansio_test_mobile/global_variables/constants.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/onboarding.png"),
              ),
            ),
          ),
          Image.asset("assets/shadow.png", fit: BoxFit.cover),

          Positioned(
            top: 228,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 68,
                width: 227,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: AppColors.red,
                ),
                child: Center(
                  child: Image.asset("assets/lend.png", height: 31),
                ),
              ),
            ),
          ),

          //assets/onboarding_bottom_image.png
          Positioned(
            bottom: 0,
            child: Image.asset(
              "assets/onboarding_bottom_image.png",
              height: size.height * 0.4,
            ),
          ),
          Positioned(
            top: 679,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 65,
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
                        child: Image.asset(
                          "assets/forward+arrow.png",
                          height: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
