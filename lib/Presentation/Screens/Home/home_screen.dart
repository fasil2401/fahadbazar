import 'package:carousel_slider/carousel_slider.dart';
import 'package:fahadbazar/Presentation/Components/product_slide.dart';
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/images.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/Controller/ui_controls/bottom_navigation_view.dart';
import '../../Components/app_bar.dart';
import '../../Components/drawer_custom.dart';
import '../../Components/section_head.dart';
import '../../Components/top_category_slider.dart';
import 'components/carousel.dart';

final statusController = Get.put(BottomNavigationController());
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
       drawer: DrawerCustom(),
       onDrawerChanged: (bool status){
         print(status);
         statusController.check(status);

       },
      body: ListView(
        physics:const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          commonHeight2,
          const CarouselMain(),
          commonHeight2,
          Padding(
            padding: commonHorizontalPadding,
            child: Column(
              children: [
                const SectionHeadText(
                  title: 'Top Categories',
                ),
                commonHeight2,
                const TopCategories(),
                const SectionHeadText(
                  title: 'Best Sellers',
                ),
                commonHeight1,
                const ProductSlider(),
              ],
            ),
          ),
          commonHeight2,
          const CarouselMain(),
          commonHeight2,
          
          Padding(
            padding: commonHorizontalPadding,
            child: Column(
              children: [
               const SectionHeadText(title: 'Trending Products'),
                commonHeight1,
                const ProductSlider(),
              ],
            ),
          ),
           commonHeight2,
          const CarouselMain(),
          commonHeight2,
          Padding(
            padding: commonHorizontalPadding,
            child: Column(
              children: [
               const SectionHeadText(title: 'Best Products'),
                commonHeight1,
                const ProductSlider(),
              ],
            ),
          ),
          commonHeight5,
          commonHeight5
        ],
      ),
    );
  }
}
