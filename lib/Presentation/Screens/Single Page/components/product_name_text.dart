import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';

class ProductNameText extends StatelessWidget {
  final String title;
  const ProductNameText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: textBlueColor,
          fontFamily: 'Rubik',
          fontSize: 18.sp,
          fontWeight: FontWeight.w500),
    );
  }
}

class OfferPrice extends StatelessWidget {
  const OfferPrice({
    Key? key,
    required this.price,
  }) : super(key: key);
  final int price;

  @override
  Widget build(BuildContext context) {
    return Text(
      'MRP : ₹${price}',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          decoration: TextDecoration.lineThrough,
          color: mutedColor,
          fontFamily: 'Rubik',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500),
    );
  }
}
