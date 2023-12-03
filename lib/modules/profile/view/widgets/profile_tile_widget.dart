import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/modules/profile/view/widgets/profile_textfield.dart';

import '../../../../../common_widgets/common_text.dart';
import '../../../../../utils/constants/app_style.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget({
    super.key,  required this.text,
     required this.value, this.maxLines, 
     this.controller, this.isEnabled,
  });
  final String text;
  final String value;

final int? maxLines;
 final TextEditingController? controller;
 final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
           SizedBox(width: 80.w,
             child: CommonText(text: text,
             textStyle: AppStyle.style18w600Style,
             ),
           ),
           Expanded(
            child: ProfileTextField(
              controller: controller,
              hint: value,
              maxLines: maxLines,
              isEnabled: isEnabled,
            ))
        ],
      ),
    );
    // ListTile(
    //   onTap: onTap,
    //   leadingAndTrailingTextStyle: AppStyle.style18w600Style,
    //   titleTextStyle: AppStyle.style16w500Style,
    //   leading: CommonText(text: text),
    //   title: ProfileTextField(),
    //   //CommonText(text: value),
    //   trailing:
    //   (hideTrailing??false)?const SizedBox() :
    //    const Icon(Icons.arrow_forward_sharp),
    // );
  }
}