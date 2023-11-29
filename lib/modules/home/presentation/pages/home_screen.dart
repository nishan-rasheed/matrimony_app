import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/common_widgets/common_text.dart';
import 'package:matrimony/modules/home/presentation/pages/filter_page.dart';
import 'package:matrimony/modules/home/presentation/widgets/custom_cached_image.dart.dart';
import 'package:matrimony/modules/profile/presentation/pages/profile_page.dart';
import 'package:matrimony/utils/constants/app_style.dart';
import 'package:matrimony/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.backgroundColr,elevation: 0,
      iconTheme: IconThemeData(),
      leading:InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>const ProfilePages(),));
        },
        child: const Padding(
          padding:  EdgeInsets.all(8.0),
          child: CircleAvatar(),
        ),
      ),
      actions: [
        IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => FilterPage(),));
          }, 
          icon: Icon(Icons.filter_list,color: AppColor.textGreyColor,))],
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 20.h
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: AppColor.cWhite,
              borderRadius: BorderRadius.circular(20.r)
            ),
            child: Column(
              children: [
                CustomCachedmageWidget(image: 'https://media.istockphoto.com/id/1317804578/photo/one-businesswoman-headshot-smiling-at-the-camera.jpg?s=612x612&w=0&k=20&c=EqR2Lffp4tkIYzpqYh8aYIPRr-gmZliRHRxcQC5yylY=',
                width: 1.sw,
                height: 100.h,
                ),

                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(text: 'Amelia',
                        textStyle: AppStyle.style16w500Style,
                        ),
                         Row(
                          children: [
                            const Icon(Icons.location_on_rounded,color: AppColor.cGrey,),
                            5.horizontalSpace,
                            Column(
                              children: [
                                CommonText(text: 'Calicut\nKerala,india',
                                textAlign: TextAlign.start,
                                textStyle: AppStyle.style15w400Style.copyWith(color: AppColor.cGrey),
                           ),
                              ],
                            ),
                           const Spacer(),
                           CircleAvatar(
                            backgroundColor: AppColor.cWhite,
                            radius: 20.r,
                            child: Icon(Icons.favorite_rounded),
                           )
                                  
                          ],
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),
          );
        },
      ),
    );
  }
}