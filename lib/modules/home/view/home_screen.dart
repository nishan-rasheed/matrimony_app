import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/modules/authentication/controller/auth_controller.dart';
import 'package:matrimony/modules/authentication/view/splash_screen.dart';
import 'package:matrimony/modules/home/view/filter_page.dart';
import 'package:matrimony/utils/constants/app_style.dart';
import 'package:matrimony/utils/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../profile/view/profile_page.dart';
import '../controller/home_controller.dart';
import 'widgets/custom_cached_image.dart.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

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
            iconTheme: const IconThemeData(),
            leading:InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const ProfilePages(),));
              },
              child: const Padding(
                padding:  EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: AppColor.buttondarkColor,
                  child: Icon(Icons.person),
                ),
              ),
            ),
            title: StreamBuilder(
              stream: db.collection('Users').doc(fireBaseAuth.currentUser?.email).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                }
                else{
                 return CommonText(text: snapshot.data?.data()?['fullName'],
                textStyle: AppStyle.style16w500Style,);
                }
               
              }
            ),
            actions: [
              homeValue.filteredlist==null?const SizedBox():
              TextButton(onPressed: () {
                homeValue.resetFilter();
              },
              style: TextButton.styleFrom(
                foregroundColor: AppColor.buttondarkColor
              ),
               child: const CommonText(text: 'reset')),
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FilterPage(),));
                }, 
                icon:const Icon(Icons.filter_list,color: AppColor.cBlack,))],
            ),
        body:
        
         GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 20.h
          ),
          itemCount:
          homeValue.filteredlist==null?
           homeValue.profileList.length:homeValue.filteredlist?.length,
          itemBuilder: (BuildContext context, int index) {
          var item  =
          homeValue.filteredlist==null?
           homeValue.profileList[index]:homeValue.filteredlist?[index];

           

            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: AppColor.cWhite,
                borderRadius: BorderRadius.circular(20.r)
              ),
              child: Column(
                children: [
                  CustomCachedmageWidget(
                    image:  item?.image??'',
                  width: 1.sw,
                  height: 100.h,
                  ),
    
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.w),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(text: item?.fullName??'',
                          textStyle: AppStyle.style16w500Style,
                          ),
                           Row(
                            children: [
                              const Icon(Icons.location_on_rounded,color: AppColor.cGrey,),
                              5.horizontalSpace,
                              Column(
                                children: [
                                  CommonText(text: '${item?.city}\n${item?.state},${item?.country}',
                                  textAlign: TextAlign.start,
                                  textStyle: AppStyle.style15w400Style.copyWith(color: AppColor.cGrey),
                             ),
                                ],
                              ),
                                    
                            ],
                          )
                        ],
                      ),
                    ),
                  )
    
                ],
              ),
            ).animate().flip();
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
           authValue.signOut().then((v) {
            Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (context) => const SplashScreen(),), 
              (route) => false);
           });
        },
        backgroundColor: AppColor.buttondarkColor,
        child:const Icon(Icons.exit_to_app),
        ),
      ),
    );
  }
}