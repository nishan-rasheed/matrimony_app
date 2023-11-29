import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_button.dart';
import 'package:matrimony/modules/profile/presentation/controller/profile_controller.dart';
import 'package:matrimony/utils/constants/app_assets.dart';
import 'package:matrimony/utils/constants/custom_print.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/common_text.dart';
import '../../../../utils/constants/app_style.dart';
import '../../../../utils/constants/colors.dart';
import '../widgets/profile_textfield.dart';
import '../widgets/profile_tile_widget.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        foregroundColor: AppColor.buttondarkColor,
        backgroundColor: AppColor.backgroundColr,
        elevation: 1,
        // automaticallyImplyLeading: false,
        title: CommonText(text: 'Profile',),
        
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
        child: Consumer<ProfileController>(
          builder: (context, profileValue, child) => 
           Padding(
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
                        color: AppColor.cBlack,
                        child:const Icon(Icons.camera_alt_outlined,color: AppColor.cWhite,),
                      ),
                    ),
                    10.horizontalSpace,
                    Image.asset(AppAssets.homeImage,
                    height: 100.w,width: 100.w,
                    )
                  ],
                ),
              
                ProfileTileWidget(
                  onTap: () {
                    
                  }, 
                  text: 'Name :', 
                  value: 'Nishan Rasheed'),
              
                ProfileTileWidget(
                  onTap: () {
                    
                  }, 
                  text: 'Height :', 
                  value: '173 cm'),  
              
                ProfileTileWidget(
                  onTap: () {
                    
                  }, 
                  text: 'Weight :', 
                  value: '57 Kg'),  
              
                ProfileTileWidget(
                  onTap: () async{
                  
                  var currentDate = DateTime.now();

                    var datePicked = await DatePicker.showSimpleDatePicker(
                                    context,
                                    // initialDate: DateTime(2020),
                                    firstDate: DateTime(1988),
                                    lastDate: DateTime(2090),
                                    dateFormat: "dd-MMMM-yyyy",
                                    // locale: DateTimePickerLocale.en_us,
                                    looping: true,
                                  );

                 customPrint('picked date is ${(currentDate.difference(datePicked??currentDate).inDays)~/ 365}');
                  }, 
                  text: 'Age :', 
                  value: '22 years'),
              
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColor.textGreyColor
                  ),
                  child: SelectState(
                    dropdownColor: AppColor.textGreyColor,
                    onCountryChanged: (value) {}, 
                    onStateChanged:  (value) {},
                    onCityChanged: (value) {},),
                ) ,
              
              
                20.verticalSpace,
                CommonText(text: 'Address',
                textStyle: AppStyle.style16w500Style,),
                10.verticalSpace,
                ProfileTextField(),
              
                20.verticalSpace,
                CommonText(text: 'Address',
                textStyle: AppStyle.style16w500Style,),
                10.verticalSpace,
                ProfileTextField() ,
        
        
                100.verticalSpace,
                
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
        child: CommonButton(text: 'Apply Changes'),
      ) ,
    );
  }
}


