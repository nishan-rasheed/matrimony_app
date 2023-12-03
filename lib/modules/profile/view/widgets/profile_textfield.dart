import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/utils/constants/app_style.dart';

import '../../../../../utils/constants/colors.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key, this.maxLines, this.controller, this.hint, this.isEnabled, this.textInputType,
  });

 final int? maxLines;
 final TextEditingController? controller;
 final String? hint;
 final bool? isEnabled;
 final TextInputType? textInputType; 


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled??true,
      maxLines: maxLines,
       controller: controller,
      decoration: InputDecoration(
        suffixIcon:isEnabled==false? const Icon(Icons.verified):null,
        hintText: hint,
        hintStyle: isEnabled==false? AppStyle.style16w500Style:null,
        isDense: true,
        filled: true,
        fillColor: AppColor.cWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r)
        ),
        disabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r)
        ),
        focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10.r),
           borderSide: const BorderSide(color: AppColor.buttondarkColor)
        )
      ),
    );
  }
}
