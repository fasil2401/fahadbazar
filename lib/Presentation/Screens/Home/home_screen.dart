import 'package:carousel_slider/carousel_slider.dart';
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../Components/app_bar.dart';
import '../../Components/section_head.dart';
import '../../Components/top_category_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: FahadAppBar(
          title: Image.asset(
            'assets/images/appBar_head.png',
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          commonHeight2,
          CarouselSlider(
            options: CarouselOptions(
              height: 23.h,
              viewportFraction: 0.9,
              autoPlay: true,
            ),
            items: imgList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: commonScaffoldBack,
                        image: DecorationImage(
                            image: AssetImage(
                              i,
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(24)),
                  );
                },
              );
            }).toList(),
          ),
          commonHeight2,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [
                const SectionHeadText(title: 'Top Categories',),
                commonHeight2,
                const TopCategories(),
                const SectionHeadText(title: 'Top Categories',),
              ],
            ),
          )
        ],
      ),
    );
  }
}
