import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_button.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/common_widgets/common_textfield.dart';
import 'package:matrimony/utils/constants/app_assets.dart';
import 'package:matrimony/utils/constants/app_style.dart';
import 'package:matrimony/utils/constants/colors.dart';
import 'package:matrimony/utils/constants/custom_print.dart';
import 'package:provider/provider.dart';

import '../../home/view/home_screen.dart';
import '../controller/auth_controller.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static TextEditingController emailCtr = TextEditingController();
  static TextEditingController passwordCtr = TextEditingController();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();


  clearCtr(){
    emailCtr.clear();
    passwordCtr.clear();
  }

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
            Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(AppAssets.homeImage,
                  height: 200.w,width: 200.w,
                  ),
                  100.verticalSpace,
                  CommonTextField(
                  validator: (v) {
                    final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                           .hasMatch(v??'');

                   if (v?.isEmpty??false) {
                     return '*required';
                   }
                   else if (emailValid==false) {
                     return '* not valid';
                   }
                   else{
                    return null;
                   }
                  },
                  hintText: 'email address',
                  controller: emailCtr,
                  ),
                  10.verticalSpace,
                  CommonTextField(hintText: 'password',
                  validator: (v) {
                    if (v?.isEmpty??false) {
                     return '*required';
                   }
                   else{
                    return null;
                   }
                  },
                  controller: passwordCtr,),
                  40.verticalSpace,
                  CommonButton(
                    loading: authValue.loginresponse?.loading,
                    text: 'Sign in',
                  onTap: () {

                    if (formKey.currentState?.validate()??false) {
                      authValue.signInUser(emailCtr.text, passwordCtr.text).then((v){
                        if (v==null) {
                          
                        }
                        else{
                          clearCtr();
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomeScreen(),));
                        }
                      });
                    }
                    else{
                      customPrint('nooo');
                    }
                      
                      
                    },),
                  20.verticalSpace,
                  InkWell(
                    onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
            
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CommonText(text: 'Already have an account ? '),
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
      ),
    );
  }


  
}