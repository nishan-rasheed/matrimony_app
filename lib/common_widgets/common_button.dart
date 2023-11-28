import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/utils/constants/app_style.dart';
import 'package:matrimony/utils/constants/colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, this.height, this.width, required this.text});

  final double? height;
  final double? width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height??40.h,
      width: width??100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        gradient:const LinearGradient(colors: [
          AppColor.buttondarkColor,
          AppColor.buttonlightColor
        ])
      ),
      child: CommonText(text: text,
      textStyle: AppStyle.style15w400Style,
      ),
    );
  }
}