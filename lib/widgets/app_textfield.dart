import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/widgets/app_inkwell.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatefulWidget {
  final Color? filledColor;
  final bool? isPwd;
  final bool isObscureText;
  final String hintText;
  final TextEditingController controller;
  const AppTextfield({
    super.key,
    this.filledColor,
    this.isPwd,
    required this.controller,
    required this.hintText,
    this.isObscureText = false,
  });

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  bool isVisible = true;
  final FocusNode _myFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _myFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _myFocusNode.removeListener(_onFocusChange);
    _myFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Color unFocusedColor = widget.filledColor ?? AppColors.filledColor;
    return SizedBox(
      height: 50,
      child: TextFormField(
        focusNode: _myFocusNode,
        cursorColor: AppColors.blue,
        obscureText: widget.isObscureText && isVisible,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,

          hintStyle: header.copyWith(
            color: AppColors.hintTextBlue,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: widget.isPwd == true
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AppInkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: isVisible
                        ? Image.asset("assets/visibility_on.png", height: 11)
                        : Image.asset("assets/visibility_on.png", height: 11),
                  ),
                )
              : null,
          filled: true,
          fillColor: _myFocusNode.hasFocus
              ? AppColors.transparent
              : unFocusedColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.textFieldBorderGrey),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.transparent),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.transparent),
          ),
        ),
      ),
    );
  }
}
