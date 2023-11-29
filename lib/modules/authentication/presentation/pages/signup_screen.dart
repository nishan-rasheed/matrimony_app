import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_button.dart';
import 'package:matrimony/common_widgets/common_outlined_button.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/common_widgets/common_textfield.dart';
import 'package:matrimony/utils/constants/app_assets.dart';
import 'package:matrimony/utils/constants/app_style.dart';
import 'package:matrimony/utils/constants/colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme:const IconThemeData(
            color: AppColor.buttondarkColor
          ),
        backgroundColor: AppColor.backgroundColr,elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(AppAssets.homeImage,
                height: 200.w,width: 200.w,
                ),
              ),
              50.verticalSpace,
              CommonText(text: 'Iam a',
              textStyle: AppStyle.style16w500Style,
              ),
              10.verticalSpace,
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonOutlinedButton(text: 'Women',
                  width: 120.w,height: 40.h,
                  ),
                  10.horizontalSpace,
                  CommonOutlinedButton(text: 'Men',
                  width: 120.w,height: 40.h,
                  ),
                ],
              ),
              20.verticalSpace,

              CommonTextField(hintText: 'Full name',),
               10.verticalSpace,
              CommonTextField(hintText: 'email address',),
              10.verticalSpace,
              CommonTextField(hintText: 'Phone number',),
              10.verticalSpace,
              CommonTextField(hintText: 'password',),
             
              40.verticalSpace,
              CommonButton(text: 'Sign Up'),
              // 10.verticalSpace,
              // Row(mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CommonText(text: 'Already have an account ? '),
              //     CommonText(text: 'SIGNUP',
              //     textStyle: AppStyle.style15w400Style.copyWith(color: AppColor.buttondarkColor),
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}