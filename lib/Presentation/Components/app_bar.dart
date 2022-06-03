import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class FahadAppBar extends StatelessWidget {

  final Widget title;
  const FahadAppBar({
    Key? key,required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: commonScaffoldBack,
      elevation: 0,
      leadingWidth: 47,
      leading: Padding(
        padding:const EdgeInsets.only(left: 20),
        child: InkWell(
            onTap: () {},
            child: Image.asset('assets/images/menu_drawer.png', )),
      ),
      // title: Image.asset('assets/images/appBar_head.png',),
      title: title,
      centerTitle: true,
      actions: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4.w),
          child: SvgPicture.asset('assets/icons/appBar/search_appBar.svg', height: 22,),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 4.w, right: 6.w),
          child: SvgPicture.asset('assets/icons/appBar/cart.svg',height: 22),
        ),
        
      ],
    );
  }
}
