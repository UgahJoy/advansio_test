import 'package:advansio_test_mobile/auth/set_pin.dart';
import 'package:advansio_test_mobile/auth/sign_up.dart';
import 'package:advansio_test_mobile/dashboard/dashboard.dart';
import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/widgets/app_button.dart';
import 'package:advansio_test_mobile/widgets/app_rich_text.dart';
import 'package:advansio_test_mobile/widgets/app_scaffold.dart';
import 'package:advansio_test_mobile/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backGroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(20),
            Text(
              "Welcome Back!",
              style: header,
            ),
            Gap(8),
            Text(
              textAlign: TextAlign.center,
              "Sign in to continue",
              style: TextStyle(fontSize: 14),
            ),
            Gap(context.deviceHeight * 0.09),

            AppTextfield(hintText: "Email", controller: emailController),
            Gap(6),
            AppTextfield(
              isPwd: true,
              hintText: "Password",
              controller: pwdController,
              isObscureText: true,
              //isPwd: true,
            ),
            Gap(16),
            Align(
              alignment: Alignment.centerRight,
              child: Text("Forgot Password?", style: TextStyle(fontSize: 12)),
            ),
            // - Sign
            Gap(50),
            AppButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SetPin(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    ),
                    buttonText: "Save PIN",
                    title: "Set your PIN",
                    message: "You will use this to login next time",
                  ),
                ),
              ),
              instrcuction: "Sign in My Account",
            ),

            Gap(20),
            AppRichText(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              ),
              // - Sign Up
              instruction: "- Sign Up",
              question: "Don’t have an account?",
            ),
          ],
        ),
      ),
    );
  }
}
