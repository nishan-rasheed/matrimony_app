import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  const CommonText(
      {super.key,
      required this.text,
      this.color,
      this.fontWeight,
      this.fontSize,
      this.textStyle,
      this.textAlign,
      // this.lineHeight,
      });

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  // final double? lineHeight;
  @override
  Widget build(BuildContext context) {
    return Text(text,
       textAlign: textAlign??TextAlign.center,
        style:textStyle??
         TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        )
        );
  }
}
