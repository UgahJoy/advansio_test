import 'package:advansio_test_mobile/auth/auth_repository/auth_repository.dart';
import 'package:advansio_test_mobile/auth/sign_in.dart';
import 'package:advansio_test_mobile/auth/success_page.dart';
import 'package:advansio_test_mobile/helpers/app_router.dart';
import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/model/auth_model.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/widgets/agreement.dart';
import 'package:advansio_test_mobile/widgets/app_alert.dart';
import 'package:advansio_test_mobile/widgets/app_button.dart';
import 'package:advansio_test_mobile/widgets/app_rich_text.dart';
import 'package:advansio_test_mobile/widgets/app_scaffold.dart';
import 'package:advansio_test_mobile/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
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
              keyBoardType: TextInputType.emailAddress,
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
              onPressed: registerUser,
              instrcuction: "Sign up my Account",
            ),
            Gap(context.deviceHeight * 0.1),
            AppRichText(
              onTap: () => AppRouter.replaceWith(SignIn()),
              instruction: "- Sign In",
              question: "Already have an account?",
            ),
          ],
        ),
      ),
    );
  }

  void registerUser() async {
    if (nameController.text.isEmpty) {
      AppAlerts.showError("Please provider your full name...");
      return;
    }

    if (emailController.text.isEmpty || !emailController.text.contains("@")) {
      AppAlerts.showError("Please provider a valid email address...");
      return;
    }
    if (pwdController.text.isEmpty) {
      AppAlerts.showError("Please provider your password...");
      return;
    }
    if (isChecked == false) {
      AppAlerts.showError("Please agree to out Terms and Conditions...");
      return;
    }
    var allRegisteredUser = ref.read(authRepository).getRegisteredUsers();
    if (allRegisteredUser
        .where((user) =>
            user.email!.toLowerCase() == emailController.text.toLowerCase())
        .isNotEmpty) {
      AppAlerts.showError("Email already exist...");
      return;
    }

    ref.read(authRepository).createNewAccount(AuthModel(
        email: emailController.text,
        pwd: pwdController.text,
        fullName: nameController.text));

    AppRouter.replaceWith(
      SuccessPage(
          title: "Account Created!",
          message:
              "Dear user your account has been created successfully. Continue to start using app",
          onPressed: () => AppRouter.replaceWith(SignIn())),
    );
    AppAlerts.showSuccess("Account created successfully");
  }
}
