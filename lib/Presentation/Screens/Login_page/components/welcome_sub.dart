import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';

class WelcomeSub extends StatelessWidget {

  final String title;
  const WelcomeSub({
    Key? key,required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
    style: TextStyle(
      color: welcomeSub,
      fontSize: 18.sp,
      fontFamily: 'Rubik',
      fontWeight: FontWeight.w500
    ),
    );
  }
}