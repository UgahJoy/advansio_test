import 'package:advansio_test_mobile/auth/sign_in.dart';
import 'package:advansio_test_mobile/auth/success_page.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/widgets/agreement.dart';
import 'package:advansio_test_mobile/widgets/app_button.dart';
import 'package:advansio_test_mobile/widgets/app_rich_text.dart';
import 'package:advansio_test_mobile/widgets/app_scaffold.dart';
import 'package:advansio_test_mobile/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

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
    Size size = MediaQuery.of(context).size;
    return AppScaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("Welcome!", style: header.copyWith(fontWeight: FontWeight.w700)),
          SizedBox(height: 16),
          Text(
            textAlign: TextAlign.center,
            "Please provide following\ndetails for your new account",
          ),
          SizedBox(height: size.height * 0.07),
          AppTextfield(
            hintText: "Full Name",
            controller: nameController,

            //isPwd: true,
          ),
          SizedBox(height: 8),
          AppTextfield(
            hintText: "Email Address",
            controller: emailController,

            //isPwd: true,
          ),
          SizedBox(height: 8),
          AppTextfield(
            isPwd: true,
            hintText: "Password",
            controller: pwdController,
            isObscureText: true,
            //isPwd: true,
          ),

          SizedBox(height: 30),
          Agreement(isChecked: isChecked),
          SizedBox(height: 50),
          AppButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SuccessPage()),
            ),
            instrcuction: "Sign up my Account",
          ),

          SizedBox(height: 80),
          AppRichText(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),
            ),
            instruction: "- Sign In",
            question: "Already have an Account?",
          ),
        ],
      ),
    );
  }
}
