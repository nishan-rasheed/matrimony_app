import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matrimony/modules/home/presentation/widgets/custom_cached_image.dart.dart';
import 'package:matrimony/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.backgroundColr,elevation: 0,
      iconTheme: IconThemeData(),
      leading:const Padding(
        padding:  EdgeInsets.all(8.0),
        child: CircleAvatar(),
      ),
      actions: [
        IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.filter_list,color: AppColor.textGreyColor,))],
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return 10.verticalSpace;
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
           child: Column(
            children: [
              Row(
                children: [
                CustomCachedmageWidget(image: 'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg'),
                ],
              )
            ],
           ),
          );
        },
      ),
    );
  }
}