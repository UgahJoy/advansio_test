import 'package:advansio_test_mobile/auth/sign_in.dart';
import 'package:advansio_test_mobile/auth/success_page.dart';
import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/widgets/agreement.dart';
import 'package:advansio_test_mobile/widgets/app_button.dart';
import 'package:advansio_test_mobile/widgets/app_rich_text.dart';
import 'package:advansio_test_mobile/widgets/app_scaffold.dart';
import 'package:advansio_test_mobile/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backGroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(20),
            Text(
              "Welcome!",
              style: header,
            ),
            Gap(8),
            Text(
              textAlign: TextAlign.center,
              "Please provide following\ndetails for your new account",
              style: TextStyle(fontSize: 14, height: 1.7),
            ),
            Gap(context.deviceHeight * 0.07),
            AppTextfield(hintText: "Full Name", controller: nameController),
            Gap(6),
            AppTextfield(
              hintText: "Email Address",
              controller: emailController,
            ),
            Gap(6),
            AppTextfield(
              isPwd: true,
              hintText: "Password",
              controller: pwdController,
              isObscureText: true,
            ),
            Gap(12),
            Agreement(
              isChecked: isChecked,
              onChnaged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Gap(35),
            AppButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SuccessPage(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    ),
                    title: "Account Created!",
                    message:
                        "Dear user your account has been created successfully. Continue to start using app",
                  ),
                ),
              ),
              instrcuction: "Sign up my Account",
            ),
            Gap(context.deviceHeight * 0.1),
            AppRichText(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignIn()),
              ),
              instruction: "- Sign In",
              question: "Already have an account?",
            ),
          ],
        ),
      ),
    );
  }
}
