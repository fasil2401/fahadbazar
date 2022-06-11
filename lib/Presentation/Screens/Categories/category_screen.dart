import 'dart:ui';

import 'package:fahadbazar/Presentation/Components/app_bar.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/Controller/ui_controls/bottom_navigation_view.dart';
import '../../Components/app_bar_text.dart';
import '../../Components/drawer_custom.dart';
import '../../constants/colors.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
final statusController = Get.put(BottomNavigationController());
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 3;
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: FahadAppBar(
          title: AppBarText(
            title: 'Categories',
          ),
        ),
      ),
      drawer: DrawerCustom(),
      onDrawerChanged: (bool status){
         print(status);
         statusController.check(status);

       },
      body: AnimationLimiter(
        child: Padding(
          padding: EdgeInsets.only(top: 2.h, bottom: 7.h),
          child: GridView.builder(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            shrinkWrap: true,
            padding: EdgeInsets.all(_w / 60),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columnCount),
            itemCount: catImgList.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: Duration(milliseconds: 500),
                columnCount: columnCount,
                child: ScaleAnimation(
                  duration: Duration(milliseconds: 900),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 25.w,
                        height: 25.w,
                        decoration: BoxDecoration(
                      color: Color.fromARGB(255, 185, 182, 182),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(
                            catImgList[index],
                          ),
                          fit: BoxFit.cover),
                        ),
                      ),
                      commonHeight1,
                      Text(
                        catNames[index],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Rubik'),
                      )
                    ],
                  )),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
