import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/firebase_options.dart';
import 'package:matrimony/utils/constants/colors.dart';
import 'package:provider/provider.dart';

import 'modules/authentication/controller/auth_controller.dart';
import 'modules/authentication/view/splash_screen.dart';
import 'modules/home/controller/filter_controller.dart';
import 'modules/home/controller/home_controller.dart';
import 'modules/profile/controller/profile_controller.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
   await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FilterController(),),
        ChangeNotifierProvider(create: (context) => ProfileController(),),
        ChangeNotifierProvider(create: (context) => AuthController(),),
        ChangeNotifierProvider(create: (context) => HomeController(),),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context,child) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MaterialApp(
              
              title: 'matrimony appssfsfh',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: AppColor.backgroundColr,
                primarySwatch: Colors.blue
                ),
              home: const SplashScreen(),
            ),
          );
        }
      ),
    );
  }
}