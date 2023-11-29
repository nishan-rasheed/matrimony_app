import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/utils/constants/app_style.dart';
import 'package:matrimony/utils/constants/colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key, this.hintText, this.controller, this.keyBoardType, this.validator, this.focusNode,
  });

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      keyboardType: keyBoardType,
      style: AppStyle.style12w400Style,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        fillColor: AppColor.cWhite,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: AppColor.cWhite),
          borderRadius: BorderRadius.circular(30.r)),
        // enabledBorder: Bor,
        focusedBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: AppColor.buttonlightColor),
          borderRadius: BorderRadius.circular(30.r)),
        errorBorder: OutlineInputBorder(
          borderSide:const BorderSide(color: AppColor.buttondarkColor),
          borderRadius: BorderRadius.circular(30.r)),    
        
        hintText: hintText,
        hintStyle: AppStyle.style12w400Style,
        errorStyle:  AppStyle.style12w400Style    
      ),
    );
  }
}