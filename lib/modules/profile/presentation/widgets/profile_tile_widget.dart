import 'package:flutter/material.dart';

import '../../../../common_widgets/common_text.dart';
import '../../../../utils/constants/app_style.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget({
    super.key, required this.onTap, required this.text, required this.value,
  });

  final Function() onTap;
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leadingAndTrailingTextStyle: AppStyle.style18w600Style,
      titleTextStyle: AppStyle.style16w500Style,
      leading: CommonText(text: text),
      title: CommonText(text: value),
      trailing: Icon(Icons.arrow_forward_sharp) ,
    );
  }
}