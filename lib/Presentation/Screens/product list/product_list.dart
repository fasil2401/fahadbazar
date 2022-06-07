import 'package:fahadbazar/Presentation/Components/app_bar.dart';
import 'package:fahadbazar/Presentation/Components/app_bar_text.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../Components/appbar_inner.dart';
import '../../constants/colors.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarInner(visible: true,title: 'Vegitables',),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
        child: GridView.builder(
                physics:const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing:10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 0.4*width,
                ),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
              onTap: (){
                Get.toNamed('/single');
              },
              child: Stack(
                children: [
                  SizedBox(
                    // width: 50.w,
                    // height: 16.h,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        // width: 41.w,
                        // height: 16.h,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 185, 182, 182),
                          borderRadius: BorderRadius.circular(15),
                          image:const DecorationImage(
                            image: AssetImage(
                              'assets/images/products/onion.jpeg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      // width: 41.w,
                      height: 0.14* width,
                      decoration: BoxDecoration(
                          color: commonBlack.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Column(
                          children: [productName(), categoryName()],
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            );
                },
              ),
      ),
    );
  }
    Row categoryName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'vegetables',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 11.sp,
              color: mutedColor,
            ),
          ),
        ),
        Text(
          '₹60',
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            fontFamily: 'Rubik',
            fontSize: 11.sp,
            color: mutedColor,
          ),
        )
      ],
    );
  }

  Row productName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'Onion',
            style: TextStyle(
                fontFamily: 'Rubik', fontSize: 14.sp, color: textFieldColor),
          ),
        ),
        Flexible(
          child: Text(
            '₹60',
            style: TextStyle(
                fontFamily: 'Rubik', fontSize: 14.sp, color: textFieldColor),
          ),
        )
      ],
    );
  }
}
