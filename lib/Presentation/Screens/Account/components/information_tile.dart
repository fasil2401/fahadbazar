
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class InformationTile extends StatelessWidget {
  final String url;
  final String title;
  final String route;
  const InformationTile({
    Key? key,required this.url, required this.title, this.route =''
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(route);
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white70,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                url,
                height: 4.w,
                width: 4.w,
              ),
            ),
          ),
          SizedBox(width: 5.w,),
          Text(
            title,
            style: TextStyle(fontFamily: 'Rubik', fontSize: 12.sp, fontWeight: FontWeight.w100),
          ),
        ],
      ),
    );
  }
}
