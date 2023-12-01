import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_button.dart';
import 'package:matrimony/common_widgets/common_outlined_button.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/common_widgets/common_textfield.dart';
import 'package:matrimony/modules/authentication/presentation/controller/auth_controller.dart';
import 'package:matrimony/utils/constants/app_assets.dart';
import 'package:matrimony/utils/constants/app_style.dart';
import 'package:matrimony/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static TextEditingController nameCtr = TextEditingController();
  static TextEditingController emailCtr = TextEditingController();
  static TextEditingController phoneCtr = TextEditingController();
  static TextEditingController passwordCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme:const IconThemeData(
            color: AppColor.buttondarkColor
          ),
        backgroundColor: AppColor.backgroundColr,elevation: 0,
      ),

      body: Consumer<AuthController>(
        builder: (context, authValue, child) => 
        SingleChildScrollView(
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
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topRight,
                      children: [
                        CommonOutlinedButton(text: 'Women',
                      width: 120.w,height: 40.h,
                      onTap: () {
                         authValue.chooseGender(0);
                      },
                      ),
                      authValue.selectedIndex==0  ?
                      Positioned(
                        top: -5,
                        child: CircleAvatar(
                          radius: 10.r,
                          backgroundColor: AppColor.cGreen,
                          child: const FittedBox(child: Icon(Icons.done,color: AppColor.cWhite,)))):
                         const SizedBox.shrink()
                      ]
                    ),
                    10.horizontalSpace,
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topRight,
                      children: [
                        CommonOutlinedButton(text: 'Men',
                      width: 120.w,height: 40.h,
                      onTap: () {
                         authValue.chooseGender(1);
                      },
                      ),
                      authValue.selectedIndex==1?
                      Positioned(
                        top: -5,
                        child: CircleAvatar(
                          radius: 10.r,
                          backgroundColor: AppColor.cGreen,
                          child: const FittedBox(child: Icon(Icons.done,color: AppColor.cWhite,)))):
                         const SizedBox.shrink()
                      ]
                    ),
                  ],
                ),
                20.verticalSpace,
      
                CommonTextField(hintText: 'Full name',
                controller: nameCtr,
                ),
                 10.verticalSpace,
                CommonTextField(hintText: 'email address',
                controller: emailCtr,),
                10.verticalSpace,
                CommonTextField(hintText: 'Phone number',
                controller: phoneCtr,),
                10.verticalSpace,
                CommonTextField(hintText: 'password',
                controller: passwordCtr,),
               
                40.verticalSpace,
                CommonButton(text: 'Sign Up',
                onTap: () {
                  authValue.signUpUser(
                    emailCtr.text,
                    passwordCtr.text, 
                    authValue.selectedIndex==0?'Women':'Men', 
                    nameCtr.text,
                    phoneCtr.text);
                },),
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
      ),
    );
  }
}