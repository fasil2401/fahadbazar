
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final String callback;
  const LoginButton({Key? key, required this.title, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.5.h,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: textBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // <-- Radius
          ),
        ),
        onPressed: () {
          if(callback == 'login'){}else if(callback == 'register'){Get.toNamed('/verification');}
        },
        child: Text(
          title,
          style: TextStyle(
            color: textFieldColor,
            fontSize: 16.sp,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
