
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class InformationTile extends StatelessWidget {
  final String url;
  final String title;
  const InformationTile({
    Key? key,required this.url, required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white70,
          ),
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: SvgPicture.asset(
              url,
              height: 5.w,
              width: 5.w,
            ),
          ),
        ),
        SizedBox(width: 5.w,),
        Text(
          title,
          style: TextStyle(fontFamily: 'Rubik', fontSize: 17.sp),
        ),
      ],
    );
  }
}
