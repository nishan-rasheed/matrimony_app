
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_button.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/utils/constants/app_style.dart';
import 'package:matrimony/utils/constants/colors.dart';
import 'package:provider/provider.dart';

import '../controller/filter_controller.dart';
import '../controller/home_controller.dart';
import 'home_screen.dart';

class FilterPage extends StatelessWidget {
   const FilterPage({super.key});


  static TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: AppColor.buttondarkColor,
        backgroundColor: AppColor.backgroundColr,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: const CommonText(text: 'Filters',),
        
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(child: CommonText(text:'Done',
            textStyle: AppStyle.style15w400Style.copyWith(color: AppColor.buttondarkColor),
            )),
          ),
          15.horizontalSpace,
        ],
      ),
      body: Consumer2<FilterController,HomeController>(
        builder: (context, filterValue,homeValue, child) =>
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(text: 'Show Me',
              textStyle: AppStyle.style16w500Style,),
              
             10.verticalSpace,

               DefaultTabController(
                length: 3,
                child: Material(
                  color: AppColor.textGreyColor,
                  child: TabBar(
                    unselectedLabelColor: AppColor.cBlack,
                    indicator:const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColor.buttondarkColor,
                        AppColor.buttonlightColor
                      ])
                    ),
                    onTap: (index) {
                      switch (index) {
                        case 0:
                          filterValue.switchGenderTab('Men');
                          break;
                        case 1:
                          filterValue.switchGenderTab('Women');
                          break;
                        case 2:
                          filterValue.switchGenderTab('Both');
                          break;    
                        default:
                      }
                    },
                    tabs:const [
                    Tab(text: 'Gents',),
                    Tab(text: 'Ladies',),
                    Tab(text: 'Both',),
                  ]),
                ),
              ),


              20.verticalSpace,

      TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: (value) {
                  //   return null;
                  
                    
                  // },
                  
                  style: AppStyle.style16w500Style,
                  controller: locationController,
                  decoration: InputDecoration(
                    isDense: true,
                    fillColor: AppColor.textGreyColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:const BorderSide(color: AppColor.cWhite),
                      borderRadius: BorderRadius.circular(30.r)),
                    // enabledBorder: Bor,
                    focusedBorder: OutlineInputBorder(
                      borderSide:const BorderSide(color: AppColor.buttonlightColor),
                      borderRadius: BorderRadius.circular(30.r)),
                    errorBorder: OutlineInputBorder(
                      borderSide:const BorderSide(color: AppColor.buttondarkColor),
                      borderRadius: BorderRadius.circular(30.r)),    
                    
                    hintText: 'enter location',
                    hintStyle: AppStyle.style16w500Style,
                    errorStyle:  AppStyle.style16w500Style    
                  ),
                ),

          
              20.verticalSpace,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(text: 'Age Range',
                  textStyle: AppStyle.style16w500Style,),
        
                  CommonText(text: '${filterValue.currentAgeRangeValues.start.round()} - ${filterValue.currentAgeRangeValues.end.round()}',
                  textStyle: AppStyle.style15w400Style.copyWith(color: AppColor.cBlack),),
                ],
              ),
              10.verticalSpace,
              RangeSlider(
                
                activeColor: AppColor.buttondarkColor,
                inactiveColor: AppColor.buttonlightColor,
                 max: 100,
                 divisions: 10,
                labels: RangeLabels(filterValue.currentAgeRangeValues.start.round().toString(), filterValue.currentAgeRangeValues.end.round().toString()),
                values: filterValue.currentAgeRangeValues,
                 onChanged: (v){
                  filterValue.chooseAgeRange(v);
                 }),

            ///height     

               20.verticalSpace,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(text: 'Height Range (in cm)',
                  textStyle: AppStyle.style16w500Style,),
                //  Text(filterValue.currentHeightRangeValues.start.toString())
                  CommonText(text: '${filterValue.currentHeightRangeValues.start.round()} cm - ${filterValue.currentHeightRangeValues.end.round()} cm',
                  textStyle: AppStyle.style15w400Style.copyWith(color: AppColor.cBlack),),
                ],
              ),
              10.verticalSpace,
              RangeSlider(
                activeColor: AppColor.buttondarkColor,
                inactiveColor: AppColor.buttonlightColor,
                max: 220,
                min: 100,
                divisions: 20,
                labels: RangeLabels(
                  filterValue.currentHeightRangeValues.start.round().toString(),
                  filterValue.currentHeightRangeValues.end.round().toString()),
                values:filterValue.currentHeightRangeValues, 
                onChanged: (value) {
                  filterValue.chooseHeightRange(value);
                },) ,

       //weight 
               20.verticalSpace,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(text: 'Weight Range (in km)',
                  textStyle: AppStyle.style16w500Style,),
                //  Text(filterValue.currentHeightRangeValues.start.toString())
                  CommonText(text: '${filterValue.currentWeightRangeValues.start.round()} kg - ${filterValue.currentWeightRangeValues.end.round()} kg',
                  textStyle: AppStyle.style15w400Style.copyWith(color: AppColor.cBlack),),
                ],
              ),
              10.verticalSpace,
              RangeSlider(
                activeColor: AppColor.buttondarkColor,
                inactiveColor: AppColor.buttonlightColor,
                max: 150,
                min: 30,
                divisions: 10,
                labels: RangeLabels(
                  filterValue.currentWeightRangeValues.start.round().toString(),
                  filterValue.currentWeightRangeValues.end.round().toString()),
                values:filterValue.currentWeightRangeValues, 
                onChanged: (value) {
                  filterValue.chooseWeightRange(value);
                },) ,
              
              const Spacer(),

              CommonButton(text: 'Apply Changes',
              loading: homeValue.isLoading,
              onTap: () {
                homeValue.filterData(
                  filterValue.genderVal, 
                  locationController.text, 
                  filterValue.currentAgeRangeValues, 
                  filterValue.currentHeightRangeValues, 
                  filterValue.currentWeightRangeValues);

                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),)); 
              },
              ),  
              20.verticalSpace,
                   
            ],
          ),
        ),
      ),
    );
  }
}