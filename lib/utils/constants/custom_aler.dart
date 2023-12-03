import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matrimony/utils/constants/colors.dart';

class CustomAlers{
  static  customSnackbar(String text){
   Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: AppColor.buttondarkColor,
        textColor: AppColor.cWhite,
        fontSize:16.sp
    );
  }
}