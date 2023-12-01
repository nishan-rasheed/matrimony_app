import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/modules/authentication/presentation/controller/auth_controller.dart';
import 'package:matrimony/modules/authentication/presentation/model/user_model.dart';
import 'package:matrimony/modules/authentication/presentation/pages/authentication_page.dart';
import 'package:matrimony/modules/authentication/presentation/pages/splash_screen.dart';
import 'package:matrimony/modules/home/presentation/pages/filter_page.dart';
import 'package:matrimony/modules/home/presentation/widgets/custom_cached_image.dart.dart';
import 'package:matrimony/modules/profile/presentation/pages/profile_page.dart';
import 'package:matrimony/utils/constants/app_style.dart';
import 'package:matrimony/utils/constants/colors.dart';
import 'package:provider/provider.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  FirebaseAuth fireBaseAuth = FirebaseAuth.instance;
  @override
  void initState() {
   Provider.of<HomeController>(context,listen: false).getAllProfiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthController,HomeController>(
      builder: (context, authValue,homeValue, child) =>
      Scaffold(
        appBar:AppBar(backgroundColor: AppColor.backgroundColr,elevation: 0,
            iconTheme: IconThemeData(),
            leading:InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const ProfilePages(),));
              },
              child: const Padding(
                padding:  EdgeInsets.all(8.0),
                child: CircleAvatar(),
              ),
            ),
            title: StreamBuilder(
              stream: db.collection('Users').doc(fireBaseAuth.currentUser?.email).snapshots(),
              builder: (context, snapshot) {
                return CommonText(text: snapshot.data?.data()?['fullName'],
                textStyle: AppStyle.style16w500Style,);
              }
            ),
            actions: [
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FilterPage(),));
                }, 
                icon: Icon(Icons.filter_list,color: AppColor.textGreyColor,))],
            ),
        body: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 20.h
          ),
          itemCount: homeValue.profileList.length,
          itemBuilder: (BuildContext context, int index) {
            UserDataModel item  = homeValue.profileList[index];
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: AppColor.cWhite,
                borderRadius: BorderRadius.circular(20.r)
              ),
              child: Column(
                children: [
                  CustomCachedmageWidget(image: 'https://media.istockphoto.com/id/1317804578/photo/one-businesswoman-headshot-smiling-at-the-camera.jpg?s=612x612&w=0&k=20&c=EqR2Lffp4tkIYzpqYh8aYIPRr-gmZliRHRxcQC5yylY=',
                  width: 1.sw,
                  height: 100.h,
                  ),
    
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.w),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(text: item.fullName??'',
                          textStyle: AppStyle.style16w500Style,
                          ),
                           Row(
                            children: [
                              const Icon(Icons.location_on_rounded,color: AppColor.cGrey,),
                              5.horizontalSpace,
                              Column(
                                children: [
                                  CommonText(text: 'Calicut\nKerala,india',
                                  textAlign: TextAlign.start,
                                  textStyle: AppStyle.style15w400Style.copyWith(color: AppColor.cGrey),
                             ),
                                ],
                              ),
                             const Spacer(),
                             CircleAvatar(
                              backgroundColor: AppColor.cWhite,
                              radius: 20.r,
                              child: Icon(Icons.favorite_rounded),
                             )
                                    
                            ],
                          )
                        ],
                      ),
                    ),
                  )
    
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
           authValue.signOut().then((v) {
            Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (context) => SplashScreen(),), 
              (route) => false);
           });
        }),
      ),
    );
  }
}