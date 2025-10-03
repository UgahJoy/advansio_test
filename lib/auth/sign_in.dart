import 'package:advansio_test_mobile/auth/sign_up.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/widgets/app_button.dart';
import 'package:advansio_test_mobile/widgets/app_rich_text.dart';
import 'package:advansio_test_mobile/widgets/app_scaffold.dart';
import 'package:advansio_test_mobile/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

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
    Size size = MediaQuery.of(context).size;
    return AppScaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Welcome Back!",
            style: header.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 16),
          Text(textAlign: TextAlign.center, "Sign in to continue "),
          SizedBox(height: size.height * 0.1),

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
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Text("Forgot Password?", style: TextStyle(fontSize: 12)),
          ),
          // - Sign
          SizedBox(height: 50),
          AppButton(onPressed: () {}, instrcuction: "Sign in My Account"),

          SizedBox(height: 20),
          AppRichText(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
            ),
            instruction: "- Sign Up",
            question: "Already have an Account?",
          ),
        ],
      ),
    );
  }
}
