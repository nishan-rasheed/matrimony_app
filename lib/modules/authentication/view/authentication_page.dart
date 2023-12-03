import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_outlined_button.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/utils/constants/app_style.dart';

import '../../../../common_widgets/common_button.dart';
import '../../../../utils/constants/app_assets.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 40.w,vertical: 80.h),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(AppAssets.birdImage,
            height: 200.w,width: 200.w,
            ),
          CommonText(text: 'Take the first step towards your happily ever after.\nJoin our app now.',
          textStyle: AppStyle.style12w400Style,
          ), 

        Column(
        children: [
          CommonButton(text: 'Sign in',
          onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) =>const LoginScreen(),));
          },
          ),
           20.verticalSpace,
         CommonOutlinedButton(text: 'Join us',
          onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
                },
          )
        ],
       )
          
           
          ],
         ),
      ),
    );
  }
}