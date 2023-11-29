import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/colors.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.cWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r)
        ),
        focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10.r),
           borderSide: BorderSide(color: AppColor.buttondarkColor)
        )
      ),
    );
  }
}
