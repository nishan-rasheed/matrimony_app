import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_button.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/utils/constants/app_assets.dart';
import 'package:matrimony/utils/constants/app_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(AppAssets.homeImage,
        height: 300.w,width: 300.w,
        ),
        CommonButton(text: 'sign in',),

        CommonText(text: 'Find your perfect match with\nour powerfull algorithm',
        textStyle: AppStyle.style12w400Style,
        )
      ],
     ),
    );
  }
}