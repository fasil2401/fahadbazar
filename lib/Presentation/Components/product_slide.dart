import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/heights.dart';
import '../constants/images.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 18.h,
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: catImgList.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              SizedBox(
                width: 44.w,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 41.w,
                    height: 16.h,
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
                  width: 41.w,
                  height: 5.5.h,
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
              offerTag(),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 3.w,
        ),
      ),
    );
  }








  Positioned offerTag() {
    return Positioned(
              right: 0,
              child: CircleAvatar(
                backgroundColor: textBlueColor,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('20%', 
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500
                      ),
                      ),
                      Text('off', 
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400
                      ),
                      )
                    ],
                  ),
                ),
              ),);
  }

  Row categoryName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'vegetables',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 11.sp,
              color: mutedColor,
            ),
          ),
        ),
        Flexible(
          child: Text(
            '₹60',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              fontFamily: 'Rubik',
              fontSize: 11.sp,
              color: mutedColor,
            ),
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
