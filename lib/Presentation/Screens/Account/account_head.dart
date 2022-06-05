
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class AccountHead extends StatelessWidget {
  const AccountHead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12.4.w,
          backgroundColor: textBlueColor,
          child: CircleAvatar(
            radius: 12.w,
            backgroundImage:
                const AssetImage('assets/images/profile.jpeg'),
          ),
        ),
        SizedBox(width: 4.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi,',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 19.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Angelina Jolie',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            commonHeight1,
            Text(
              'fasil2401@gmail.com',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '8590385573',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    );
  }
}
