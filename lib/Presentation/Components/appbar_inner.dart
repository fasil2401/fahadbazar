
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';
import 'app_bar_text.dart';

class AppBarInner extends StatelessWidget {
  final bool visible;
  final String title;
  const AppBarInner({
    Key? key,  this.visible = false, required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: commonScaffoldBack,
      elevation: 0,
      leadingWidth: 47,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: SvgPicture.asset(
            'assets/icons/circled_back.svg',
          ),
        ),
      ),
      // title: Image.asset('assets/images/appBar_head.png',),
      title:  AppBarText(title: title),
      centerTitle: true,
      actions: [
        Visibility(
          visible: visible,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 4.w),
            child: SvgPicture.asset('assets/icons/appBar/filter.svg', height: 22,),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.w, right: 6.w),
          child: SvgPicture.asset('assets/icons/appBar/cart.svg', height: 22),
        ),
      ],
    );
  }
}
