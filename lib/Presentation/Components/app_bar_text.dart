
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class AppBarText extends StatelessWidget {
  final String title;
  const AppBarText({
    Key? key,required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
    style: TextStyle(
      fontFamily: 'Rubik',
      color: splashBackColor,
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
    ),
    );
  }
}