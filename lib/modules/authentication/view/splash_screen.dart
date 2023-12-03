import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/utils/constants/app_assets.dart';
import 'package:matrimony/utils/constants/app_style.dart';

import 'wrapper_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



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
          ).animate().fadeIn(
            duration: 1000.ms
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