import 'package:fahadbazar/Presentation/Components/product_slide.dart';
import 'package:fahadbazar/Presentation/Screens/Home/components/carousel_shimmer.dart';
import 'package:fahadbazar/Presentation/Screens/Home/components/category_shimmer.dart';
import 'package:fahadbazar/Presentation/Screens/Home/components/product_slider_shimmer.dart';
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:fahadbazar/logic/Controller/api/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/Controller/ui_controls/bottom_navigation_view.dart';
import '../../Components/app_bar.dart';
import '../../Components/drawer_custom.dart';
import '../../Components/section_head.dart';
import '../../Components/top_category_slider.dart';
import 'components/carousel.dart';

final statusController = Get.put(BottomNavigationController());

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
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
      onDrawerChanged: (bool status) {
        print(status);
        statusController.check(status);
      },
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          commonHeight2,
          Obx(() => homeController.banners.isNotEmpty
              ? CarouselMain(
                  list: homeController.banners,
                )
              : CarouselShimmer(
                  w: width,
                )),
          commonHeight2,
          Padding(
            padding: commonHorizontalPadding,
            child: Column(
              children: [
                const SectionHeadText(
                  title: 'Top Categories',
                ),
                commonHeight2,
                Obx(() => homeController.categories.isNotEmpty
                    ? TopCategories(
                        list: homeController.categories,
                      )
                    : CategoryShimmer(
                        w: width,
                      )),
                const SectionHeadText(
                  title: 'Best Sellers',
                ),
                commonHeight1,
                Obx(() => homeController.popularsProducts.isNotEmpty
                    ? ProductSlider(
                        list: homeController.popularsProducts,
                        catList: homeController.categories,
                      )
                    : ProductShimmer(
                        w: width,
                      )),
              ],
            ),
          ),
          commonHeight2,
          // Obx(
          //   () => CarouselMain(
          //     list: [homeController.sbanners.value],
          //   ),
          // ),
          Obx(
            () => homeController.sbanners.value.image.isNotEmpty
                ? CarouselMain(
                    list: [homeController.sbanners.value],
                  )
                : CarouselShimmer(
                    w: width,
                  ),
          ),
          commonHeight2,
          Padding(
            padding: commonHorizontalPadding,
            child: Column(
              children: [
                const SectionHeadText(title: 'Trending Products'),
                commonHeight1,
                //  ProductSlider(list: homeController.trendingProducts,catList: homeController.categories,),
                Obx(() => homeController.trendingProducts.isNotEmpty
                    ? ProductSlider(
                        list: homeController.trendingProducts,
                        catList: homeController.categories,
                      )
                    : ProductShimmer(
                        w: width,
                      )),
              ],
            ),
          ),
          commonHeight2,
          // Obx(
          //   () => CarouselMain(list: homeController.fbanners.value),
          // ),
          Obx(() => homeController.fbanners.isNotEmpty
              ? CarouselMain(
                  list: homeController.fbanners,
                )
              : CarouselShimmer(
                  w: width,
                )),
          commonHeight2,
          Padding(
            padding: commonHorizontalPadding,
            child: Column(
              children: [
                const SectionHeadText(title: 'Best Products'),
                commonHeight1,
                //  ProductSlider(list: homeController.bestOffersProducts,catList: homeController.categories,),
                Obx(() => homeController.bestOffersProducts.isNotEmpty
                    ? ProductSlider(
                        list: homeController.bestOffersProducts,
                        catList: homeController.categories,
                      )
                    : ProductShimmer(
                        w: width,
                      )),
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
