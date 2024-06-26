import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import 'product_name_text.dart';

class ProductNameRow extends StatelessWidget {
  const ProductNameRow({
    Key? key,
    required this.productName,
    required this.availability,
    required this.offer,
  }) : super(key: key);
  final String productName;
  final String availability;
  final String offer;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ProductNameText(
                  title: productName,
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Container(
                decoration: BoxDecoration(
                    color: offrGreen, borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    '${offer}% Off',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
            ],
          ),
        ),
        availability == 'Available'
            ? SvgPicture.asset(
                'assets/icons/instock.svg',
                height: 5.w,
                width: 8.w,
              )
            : SvgPicture.asset(
                'assets/icons/outofstock.svg',
                height: 5.w,
                width: 8.w,
              ),
      ],
    );
  }
}
