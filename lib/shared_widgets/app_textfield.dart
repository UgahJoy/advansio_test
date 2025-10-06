import 'package:advansio_test_mobile/theme/app_colors.dart';
import 'package:advansio_test_mobile/theme/text_style.dart';
import 'package:advansio_test_mobile/widgets/app_inkwell.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatefulWidget {
  final Color? filledColor;
  final bool? isPwd;
  final bool isObscureText;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FontWeight? hintTextFontWeight;
  final double? hintTextfontSize;
  final TextEditingController controller;
  final Color? hintTextColor;
  final Function()? onTap;
  final bool showPrefixIcon;
  final bool readOnly;
  final Function(String)? onChanged;
  final TextInputType? keyBoardType;
  const AppTextfield({
    super.key,
    this.filledColor,
    this.readOnly = false,
    this.isPwd,
    this.onTap,
    this.showPrefixIcon = false,
    this.suffixIcon,
    this.onChanged,
    this.hintTextColor,
    this.prefixIcon,
    this.hintTextfontSize,
    this.hintTextFontWeight,
    required this.controller,
    required this.hintText,
    this.keyBoardType,
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
        keyboardType: widget.keyBoardType,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        focusNode: _myFocusNode,
        cursorColor: AppColors.blue,
        obscureText: widget.isObscureText && isVisible,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 15,
          ),
          hintStyle: header.copyWith(
            color: widget.hintTextColor ?? AppColors.hintTextBlue,
            fontSize: widget.hintTextfontSize ?? 15,
            fontWeight: widget.hintTextFontWeight ?? FontWeight.w400,
          ),
          prefixIcon: widget.showPrefixIcon
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: widget.prefixIcon,
                )
              : null,
          suffixIcon: widget.isPwd == true
              ? Padding(
                  padding: EdgeInsets.all(isVisible ? 20 : 6),
                  child: AppInkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: isVisible
                        ? Image.asset("assets/visibility_on.png", height: 11)
                        : Image.asset("assets/visibility_off.png", height: 11),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: widget.suffixIcon,
                ),
          filled: true,
          fillColor:
              _myFocusNode.hasFocus ? AppColors.transparent : unFocusedColor,
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
