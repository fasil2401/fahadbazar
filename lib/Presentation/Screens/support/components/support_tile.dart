
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/border_radius.dart';
import '../../../constants/colors.dart';

class SupportTile extends StatelessWidget {
  const SupportTile({
    Key? key,
    required this.sw,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final double sw;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.w),
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: cartRadius
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/support/$icon.svg'),
            SizedBox(width: sw*0.07,),
            Expanded(child: Text(title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: supportColor
            ),
            ),),
            SvgPicture.asset('assets/icons/support/more.svg'),
    
          ],
        ),
      ),
    );
  }
}