import 'package:fahadbazar/Presentation/Components/section_head.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Components/product_slide.dart';
import '../../Components/top_category_slider.dart';
import '../../constants/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: commonHorizontalPadding,
          child: ListView(
            children: [
              commonHeight2,
              Row(
                children: [
                  Flexible(child: 
                  CupertinoTextField(
                  // controller: _emailorphoneController
                  decoration: BoxDecoration(
                    color: textFieldColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  style: TextStyle(fontSize: 16.sp),
                  placeholder: 'Search for products',
                  placeholderStyle: TextStyle(
                      color: CupertinoColors.placeholderText,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w200,
                      fontSize: 14.sp),
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  // prefix: Padding(
                  //   padding: EdgeInsets.only(left: 4.w),
                  //   child: SvgPicture.asset(
                  //     'assets/icons/user.svg',
                  //     height: 16.sp,
                  //   ),
                  // ),
                  suffix: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SvgPicture.asset('assets/icons/appBar/search_appBar.svg', height: 22,color: mutedColor,),
                  ),
                ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Padding(
                       padding: const EdgeInsets.only(left: 15),
                      child: Icon(Icons.close,
                      color: mutedColor,),
                    ),
                  ),
                 
                ],
              ),
               commonHeight3,
               const SectionHeadText(
                  title: 'Best Sellers',
                ),
                commonHeight1,
                // const ProductSlider(),
                commonHeight3,
                  const SectionHeadText(
                  title: 'Top Categories',
                ),
                commonHeight2,
                // const TopCategories(),
                
            ],
          ),
        ),
      ),
    );
  }
}