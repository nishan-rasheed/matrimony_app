import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ErrorShimmerWidget extends StatelessWidget {
  const ErrorShimmerWidget({
    super.key,  this.height,  this.width,
  });
 
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
                  direction: ShimmerDirection.ttb, 
                  baseColor: Colors.grey.shade300,
                   highlightColor: Colors.grey.shade100,
                  child: Container(
                    color: Colors.white,
                    height: height,width: width,),);
  }
}
