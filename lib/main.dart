import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/modules/authentication/presentation/pages/splash_screen.dart';
import 'package:matrimony/utils/constants/colors.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context,child) {
        return MaterialApp(
          
          title: 'matrimony appssfsfh',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColor.backgroundColr,
            primarySwatch: Colors.blue
            ),
          home: const SplashScreen(),
        );
      }
    );
  }
}