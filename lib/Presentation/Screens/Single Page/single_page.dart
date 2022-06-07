import 'package:fahadbazar/Presentation/Components/appbar_inner.dart';
import 'package:fahadbazar/Presentation/Components/section_head.dart';
import 'package:fahadbazar/Presentation/Screens/Single%20Page/components/product_name_text.dart';
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'components/product_name_row.dart';

class SinglePage extends StatelessWidget {
  const SinglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarInner(
          visible: false,
          title: 'Onion',
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          coverImage(),
          commonHeight2,
          Padding(
            padding: commonHorizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProductNameRow(),
                const ProductNameText(title: 'MRP : ₹160'),
                const OfferPrice(),
                commonHeight5,
                const SectionHeadText(
                  title: 'Quick overview',
                  tail: false,
                ),
                commonHeight1,
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  style: TextStyle(fontFamily: 'Rubik', fontSize: 12.sp),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container coverImage() {
    return Container(
      width: double.infinity,
      height: 30.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/banner_images/banner1.jpeg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
