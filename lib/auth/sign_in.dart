import 'package:advansio_test_mobile/auth/auth_repository/auth_repository.dart';
import 'package:advansio_test_mobile/auth/set_pin.dart';
import 'package:advansio_test_mobile/auth/sign_up.dart';
import 'package:advansio_test_mobile/dashboard/dashboard.dart';
import 'package:advansio_test_mobile/helpers/app_router.dart';
import 'package:advansio_test_mobile/helpers/extensions.dart';
import 'package:advansio_test_mobile/shared_state/app_state.dart';
import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/shared_widgets/app_alert.dart';
import 'package:advansio_test_mobile/shared_widgets/app_button.dart';
import 'package:advansio_test_mobile/shared_widgets/app_rich_text.dart';
import 'package:advansio_test_mobile/shared_widgets/app_scaffold.dart';
import 'package:advansio_test_mobile/shared_widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
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
            AppTextfield(
                keyBoardType: TextInputType.emailAddress,
                hintText: "Email",
                controller: emailController),
            Gap(6),
            AppTextfield(
              isPwd: true,
              hintText: "Password",
              controller: pwdController,
              isObscureText: true,
            ),
            Gap(16),
            Align(
              alignment: Alignment.centerRight,
              child: Text("Forgot Password?", style: TextStyle(fontSize: 12)),
            ),
            Gap(50),
            AppButton(
              onPressed: signInUser,
              instrcuction: "Sign in My Account",
            ),
            Gap(20),
            AppRichText(
              onTap: () => AppRouter.replaceWith(SignUp()),
              instruction: "- Sign Up",
              question: "Don’t have an account?",
            ),
          ],
        ),
      ),
    );
  }

  void signInUser() async {
    if (emailController.text.isEmpty || !emailController.text.contains("@")) {
      AppAlerts.showError("Please provider a valid email address...");
      return;
    }
    if (pwdController.text.isEmpty) {
      AppAlerts.showError("Please provider your password...");
      return;
    }
    var allRegisteredUser = ref.read(authRepository).getRegisteredUsers();

    if (allRegisteredUser
        .where((users) =>
            users.email!.toLowerCase() == emailController.text.toLowerCase())
        .isEmpty) {
      AppAlerts.showError("Account not found...");
      return;
    }

    var authModel = allRegisteredUser.firstWhere(
        (e) => e.email!.toLowerCase() == emailController.text.toLowerCase());
    if (authModel.pwd != pwdController.text) {
      AppAlerts.showError("Incorrect password...");
      return;
    }

    ref.read(appState).setCurrentUser(authModel);
    if ((authModel.pin ?? "").isNotEmpty) {
      AppRouter.replaceWith(Dashboard());
      return;
    }
    AppRouter.navigateTo(SetPin(
      onTap: (val) {
        authModel.pin = val;
        ref.read(authRepository).setAccountPin(authModel);
        AppRouter.clearAllAndPush(Dashboard());
      },
      buttonText: "Save PIN",
      title: "Set your PIN",
      message: "You will use this to login next time",
    ));
  }
}
