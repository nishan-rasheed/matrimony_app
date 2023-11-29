import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../common_widgets/error_shimmer.dart';


class CustomCachedmageWidget extends StatelessWidget {
  const CustomCachedmageWidget({
    super.key,
    required this.image, 
    this.width, 
    this.height,
  });

  final String image;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
    fit: BoxFit.cover,
    height: height??88.h,width: width??88.w,
    imageUrl: image,
    progressIndicatorBuilder: (context, url, downloadProgress) => 
    ErrorShimmerWidget(height: height??88.h,width: width??88.w,),
    errorWidget: (context, url, error) => const  Icon(Icons.error),
              );
  }
}
