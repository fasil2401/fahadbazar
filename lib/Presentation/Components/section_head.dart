import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class SectionHeadText extends StatelessWidget {

  final String title;
  final bool tail;
  const SectionHeadText({
    Key? key,required this.title, this.tail = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
        style: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500
        ),
        ),
        Visibility(
          visible: tail,
          child: InkWell(
            onTap: (){
              Get.toNamed('/products');
            },
            child: Text('view all',
            style: TextStyle(
              // decoration: TextDecoration.underline,
              fontFamily: 'Rubik',
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: textBlueColor
            ),
            ),
          ),
        )  
      ],
    );
  }
}
