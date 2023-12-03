import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_button.dart';
import 'package:matrimony/modules/profile/view/widgets/profile_textfield.dart';
import 'package:matrimony/modules/profile/view/widgets/profile_tile_widget.dart';
import 'package:matrimony/utils/constants/custom_print.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/common_text.dart';
import '../../../../utils/constants/app_style.dart';
import '../../../../utils/constants/colors.dart';
import '../../authentication/model/user_model.dart';
import '../../home/controller/home_controller.dart';
import '../controller/profile_controller.dart';

class ProfilePages extends StatefulWidget {
  const ProfilePages({Key? key}) : super(key: key);

  

  @override
  State<ProfilePages> createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {

  static TextEditingController heightCtr = TextEditingController();
  static TextEditingController weightCtr = TextEditingController();
  static TextEditingController ageCtr = TextEditingController();
  static TextEditingController jobCtr = TextEditingController();
  static TextEditingController countryCtr = TextEditingController();
  static TextEditingController stateCtr = TextEditingController();
  static TextEditingController cityCtr = TextEditingController();
  static TextEditingController residentialAddressCtr = TextEditingController();
  static TextEditingController familyInfoCtr = TextEditingController();
 
  @override
  void initState() {
   
setValues();
    super.initState();
  }

  setValues (){
     var customerValue = Provider.of<HomeController>(context,listen: false);
    heightCtr.text = customerValue.currentUserDetails?.height??'';
    weightCtr.text = customerValue.currentUserDetails?.weight??'';
    ageCtr.text = customerValue.currentUserDetails?.age??'';
    jobCtr.text = customerValue.currentUserDetails?.job??'';
    countryCtr.text = customerValue.currentUserDetails?.country??'';
    stateCtr.text = customerValue.currentUserDetails?.state??'';
    cityCtr.text = customerValue.currentUserDetails?.city??'';
    residentialAddressCtr.text = customerValue.currentUserDetails?.address??'';
    familyInfoCtr.text = customerValue.currentUserDetails?.familyInfo??'';

   customPrint(countryCtr.text); 
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProfileController,HomeController>(
          builder: (context, profileValue,homeValue, child) => 
        Scaffold(
        extendBody: true,
        appBar: AppBar(
          foregroundColor: AppColor.buttondarkColor,
          backgroundColor: AppColor.backgroundColr,
          elevation: 1,
          // automaticallyImplyLeading: false,
          title: const CommonText(text: 'Profile',),
          
          // actions: [
          //   InkWell(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: Center(child: CommonText(text:'Done',
          //     textStyle: AppStyle.style15w400Style.copyWith(color: AppColor.buttondarkColor),
          //     )),
          //   ),
          //   15.horizontalSpace,
          // ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              profileValue.pickImage();
                            },
                            child: Container(
                              height: 100.w,width: 100.w,
                              
                              decoration: BoxDecoration(
                                color: AppColor.cBlack,
                                image: DecorationImage(
                                  image: NetworkImage(homeValue.currentUserDetails?.image??''),
                                  fit: BoxFit.fill
                                  )
                              ),
                              child:const Icon(Icons.camera_alt_outlined,color: AppColor.cWhite,),
                            ),
                          ),
                          10.horizontalSpace,

                          profileValue.pickedImage==null?
                          const CommonText(text: 'Add Image'):
                          Image.file(profileValue.pickedImage??File(''),
                          height: 100.w,width: 100.w,
                          fit: BoxFit.cover,)
                          // Image.asset(AppAssets.homeImage,
                          // height: 100.w,width: 100.w,
                          // )
                        ],
                      ),
                    
                       ProfileTileWidget(
                        isEnabled: false,
                        text:'Name :', 
                        value: homeValue.currentUserDetails?.fullName??''),  

                      ProfileTileWidget(
                        isEnabled: false,
                        text:'email :', 
                        value: homeValue.currentUserDetails?.email??''),
                      ProfileTileWidget(
                        isEnabled: false,
                        text:'Phone :', 
                        value: homeValue.currentUserDetails?.phoneNumber??''), 
                      ProfileTileWidget(
                        isEnabled: false,
                        text:'Gender :', 
                        value: homeValue.currentUserDetails?.gender??''),        
                    
                      ProfileTileWidget(
                        controller: heightCtr,
                        text: 'Height :', 
                        value: '(In cm)'),  
                    
                      ProfileTileWidget(
                        controller: weightCtr,
                        text: 'Weight :', 
                        value: '(In Kg)'),  
                    
                      ProfileTileWidget(
                      //   onTap: () async{
                        
                      //   var currentDate = DateTime.now();
              
                      //     var datePicked = await DatePicker.showSimpleDatePicker(
                      //                     context,
                      //                     // initialDate: DateTime(2020),
                      //                     firstDate: DateTime(1988),
                      //                     lastDate: DateTime(2090),
                      //                     dateFormat: "dd-MMMM-yyyy",
                      //                     // locale: DateTimePickerLocale.en_us,
                      //                     looping: true,
                      //                   );
              
                      //  customPrint('picked date is ${(currentDate.difference(datePicked??currentDate).inDays)~/ 365}');
                      //   }, 
                        controller: ageCtr,
                        text: 'Age :', 
                        value: 'In years'),

                       ProfileTileWidget(
                        controller: jobCtr,
                        text:'Job :', 
                        value: 'enter your job'),   
                      const Divider(),
                      CommonText(text: 'Location & Address :',
                      textStyle: AppStyle.style18w600Style,),

                      30.verticalSpace,
    
                      // homeValue.currentUserDetails?.country==null?
                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 10.w),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20.r),
                      //     color: AppColor.textGreyColor
                      //   ),
                      //   child: SelectState(
                      //     dropdownColor: AppColor.textGreyColor,
                      //     onCountryChanged: (value) {}, 
                      //     onStateChanged:  (value) {},
                      //     onCityChanged: (value) {},),
                      // ) :
                     Column(
                      children: [
                        ProfileTileWidget(
                        controller: countryCtr,
                        text: 'Country :', 
                        value:'Enter country'), 
    
                        ProfileTileWidget(
                        controller: stateCtr,
                        text: 'State :', 
                        value: 'Enter state'), 
    
                        ProfileTileWidget(
                        controller: cityCtr,
                        text: 'City :', 
                        value: 'Enter city'), 
                      ],
                     ),
                    
                    
                      20.verticalSpace,
                      CommonText(text: 'Residential Address',
                      textStyle: AppStyle.style16w500Style,),
                      10.verticalSpace,
                       ProfileTextField(maxLines: 5,
                        controller: residentialAddressCtr,),
                    
                      20.verticalSpace,
                      CommonText(text: 'Family Info',
                      textStyle: AppStyle.style16w500Style,),
                      10.verticalSpace,
                       ProfileTextField(maxLines: 5,
                        controller: familyInfoCtr,) ,
                      
                      
                      100.verticalSpace,
                      
                    ],
                  ),
            ),),
        bottomNavigationBar: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          child: CommonButton(text: 'Apply Changes',
          loading: profileValue.isloading,
          onTap: () {

            profileValue.addImagetoFirebase(profileValue.pickedImage).whenComplete(() {
            profileValue.updateProfile(
              UserDataModel(
                address: residentialAddressCtr.text,
                age: '34',
                city: cityCtr.text,
                country:countryCtr.text,
                familyInfo:familyInfoCtr.text,
                gender: homeValue.currentUserDetails?.gender,
                height: heightCtr.text,
                image:profileValue.imageUrl,
                job: jobCtr.text,
                phoneNumber: homeValue.currentUserDetails?.phoneNumber,
                state: stateCtr.text,
                weight: weightCtr.text,
                email:  homeValue.currentUserDetails?.email,
                fullName:  homeValue.currentUserDetails?.fullName,
              )
              );
            });
            // profileValue.addImagetoFirebase(profileValue.)
            // profileValue.updateProfile(
            //   UserDataModel(
            //     address: residentialAddressCtr.text,
            //     age: '23',
            //     city: cityCtr.text,
            //     country:countryCtr.text,
            //     familyInfo:familyInfoCtr.text,
            //     gender: homeValue.currentUserDetails?.gender,
            //     height: heightCtr.text,
            //     image: 'knfknffnkf',
            //     job: jobCtr.text,
            //     phoneNumber: homeValue.currentUserDetails?.phoneNumber,
            //     state: stateCtr.text,
            //     weight: weightCtr.text,
            //     email:  homeValue.currentUserDetails?.email,
            //     fullName:  homeValue.currentUserDetails?.fullName,
            //   )
            //   );
          },
          
          ),
        ) ,
      ),
    );
  }
}


