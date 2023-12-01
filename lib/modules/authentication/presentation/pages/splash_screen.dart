import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_button.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/modules/authentication/presentation/pages/authentication_page.dart';
import 'package:matrimony/modules/authentication/presentation/pages/wrapper_screen.dart';
import 'package:matrimony/modules/home/presentation/pages/home_screen.dart';
import 'package:matrimony/utils/constants/app_assets.dart';
import 'package:matrimony/utils/constants/app_style.dart';
import 'package:matrimony/utils/constants/custom_print.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  void initState() {

  Future.delayed(const Duration(seconds: 2),() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WrapperScreen(),));
   },);

    super.initState();
  }



   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(AppAssets.homeImage,
          height: 300.w,width: 300.w,
          ),
     
          CommonText(text: 'Find your perfect match with\nour powerfull algorithm',
          textStyle: AppStyle.style12w400Style,
          )
        ],
       ),
     ),
    );
  }
}