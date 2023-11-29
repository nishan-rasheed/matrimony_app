import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/utils/constants/app_style.dart';
import 'package:matrimony/utils/constants/colors.dart';

class CommonOutlinedButton extends StatelessWidget {
  const CommonOutlinedButton({super.key, this.height, this.width, required this.text, this.onTap, this.loading});

  final double? height;
  final double? width;
  final String text;
  final Function()? onTap;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(loading??false)?(){}:onTap,
      child: Container(
        alignment: Alignment.center,
        height: height??55.h,
        width: width??1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: AppColor.buttondarkColor)
        ),
        child:
        (loading??false)?
        const CircularProgressIndicator():
         CommonText(text: text,
        textStyle: AppStyle.style15w400Style.copyWith(color: AppColor.buttondarkColor),
        ),
      ),
    );
  }
}