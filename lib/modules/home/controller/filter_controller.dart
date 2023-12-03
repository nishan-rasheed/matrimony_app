import 'package:flutter/material.dart';
import 'package:matrimony/utils/constants/custom_print.dart';

class FilterController extends ChangeNotifier{


  String genderVal = 'Men';
  switchGenderTab(String v){
   genderVal = v;
   notifyListeners();
  }

 
 RangeValues currentAgeRangeValues = const RangeValues(10, 100);

 chooseAgeRange(RangeValues values){
 currentAgeRangeValues = values;
  notifyListeners();

 }



 RangeValues currentHeightRangeValues = const RangeValues(110, 180);

 chooseHeightRange(RangeValues values){
 currentHeightRangeValues = values;
  notifyListeners();

 }


 RangeValues currentWeightRangeValues = const RangeValues(55, 80);

 chooseWeightRange(RangeValues values){
 currentWeightRangeValues = values;
  notifyListeners();

 }


 //select country--
  List countries = [];
  getAllCountries()async{
   countries = await getAllCountries();
   customPrint(countries.toString());
   notifyListeners();
    }


    





}