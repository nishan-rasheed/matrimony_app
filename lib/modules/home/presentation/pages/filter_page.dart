import 'dart:convert';

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_button.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/common_widgets/common_textfield.dart';
import 'package:matrimony/modules/home/presentation/controller/filter_controller.dart';
import 'package:matrimony/utils/constants/app_style.dart';
import 'package:matrimony/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatelessWidget {
   FilterPage({super.key});


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
        title: CommonText(text: 'Filters',),
        
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
      body: Consumer<FilterController>(
        builder: (context, filterValue, child) =>
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(text: 'Show Me',
              textStyle: AppStyle.style16w500Style,),
              
             10.verticalSpace,

              const DefaultTabController(
                length: 3,
                child: Material(
                  color: AppColor.textGreyColor,
                  child: TabBar(
                    unselectedLabelColor: AppColor.cBlack,
                    indicator: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColor.buttondarkColor,
                        AppColor.buttonlightColor
                      ])
                    ),
                    tabs: [
                    Tab(text: 'Gents',),
                    Tab(text: 'Ladies',),
                    Tab(text: 'Both',),
                  ]),
                ),
              ),

              
              // CommonText(text: 'Location',
              // textStyle: AppStyle.style16w500Style,),
            //   SelectState(
            //   onCountryChanged: (value) {
            //   // setState(() {
            //   //   countryValue = value;
            //   // });
            // },
            // onStateChanged:(value) {
            //   // setState(() {
            //   //   stateValue = value;
            //   // });
            // },
            
            // ),

              20.verticalSpace,

      TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    
                  },
                  
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
              onTap: () {
                
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