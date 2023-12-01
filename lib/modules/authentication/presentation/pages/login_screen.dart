import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_button.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/common_widgets/common_textfield.dart';
import 'package:matrimony/modules/authentication/presentation/controller/auth_controller.dart';
import 'package:matrimony/modules/authentication/presentation/pages/signup_screen.dart';
import 'package:matrimony/modules/home/presentation/pages/home_screen.dart';
import 'package:matrimony/utils/constants/app_assets.dart';
import 'package:matrimony/utils/constants/app_style.dart';
import 'package:matrimony/utils/constants/colors.dart';
import 'package:matrimony/utils/constants/custom_print.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static TextEditingController emailCtr = TextEditingController();
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

      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.w),
          child: Consumer<AuthController>(
            builder: (context, authValue, child) => 
            Column(
              children: [
                Image.asset(AppAssets.homeImage,
                height: 200.w,width: 200.w,
                ),
                100.verticalSpace,
                CommonTextField(hintText: 'email address',
                controller: emailCtr,
                ),
                10.verticalSpace,
                CommonTextField(hintText: 'password',
                controller: passwordCtr,),
                40.verticalSpace,
                CommonButton(text: 'Sign in',
                onTap: () {
                    authValue.signInUser(emailCtr.text, passwordCtr.text).then((v){
                      if (v==null) {
                        customPrint('error occured');
                      }
                      else{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                      }
                    });
                    
                  },),
                20.verticalSpace,
                InkWell(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));

                  },
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(text: 'Already have an account ? '),
                      CommonText(text: 'SIGNUP',
                      textStyle: AppStyle.style15w400Style.copyWith(color: AppColor.buttondarkColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  
}