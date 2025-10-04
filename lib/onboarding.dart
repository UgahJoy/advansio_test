import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/widgets/get_started_button.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
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
            top: context.deviceHeight * 0.26,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 60,
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              width: double.infinity,
              "assets/onboarding_bottom_image.png",
            ),
          ),
          Positioned(
            bottom: context.deviceHeight * 0.2,
            left: 0,
            right: 0,
            child: GetStartedButton(),
          ),
        ],
      ),
    );
  }
}
