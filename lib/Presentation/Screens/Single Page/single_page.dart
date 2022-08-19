import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fahadbazar/Presentation/Components/appbar_inner.dart';
import 'package:fahadbazar/Presentation/Components/product_slide.dart';
import 'package:fahadbazar/Presentation/Components/section_head.dart';
import 'package:fahadbazar/Presentation/Screens/Single%20Page/components/product_name_text.dart';
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../Components/common_button.dart';
import 'components/product_name_row.dart';

class SinglePage extends StatelessWidget {
  SinglePage({Key? key}) : super(key: key);
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item`7',
    'Item8',
  ];
  String? selectedValue;
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
          commonHeight1,
          Padding(
            padding: commonHorizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProductNameRow(),
                commonHeight1,
                Row(
                  children: [
                    dropDownButton('Unit:'),
                    SizedBox(width: 20,),
                    dropDownButton('Qty:'),
                  ],
                ),
                commonHeight2,
                const ProductNameText(title: 'MRP : ₹160'),
                const OfferPrice(),
                commonHeight3,
                const SectionHeadText(
                  title: 'Quick overview',
                  tail: false,
                ),
                commonHeight1,
                overviewText(),
                commonHeight3,
                const SectionHeadText(
                  title: 'Similar Products',
                  tail: false,
                ),
                commonHeight1,
                // const ProductSlider(),
                commonHeight4,
                addToCartButton(),
                commonHeight2,
                 CommonButton(text: 'Buy Now', onPressed: () {}),
                commonHeight5
              ],
            ),
          )
        ],
      ),
    );
  }

  DropdownButtonHideUnderline dropDownButton(String hint) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: SizedBox(
          width: 33,
          child: Text(
            hint,
            // overflow: TextOverflow.ellipsis,
            style:const TextStyle(
                fontSize: 14,
                color: commonBlack,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w500),
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    //overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          selectedValue = value as String;
        },
        icon: SvgPicture.asset('assets/icons/drop_down.svg'),
        iconSize: 14,
        iconEnabledColor: Colors.yellow,
        iconDisabledColor: Colors.grey,
        buttonHeight: 30,
        buttonWidth: 80,
        buttonPadding: const EdgeInsets.only(left: 12, right: 12),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(
          //   color: Colors.black26,
          // ),
          color: mutedBackColor,
        ),
        buttonElevation: 2,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        dropdownWidth: 100,
        // dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: mutedBackColor,
        ),
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(0, 0),
      ),
    );
  }

  Text overviewText() {
    return Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      style: TextStyle(fontFamily: 'Rubik', fontSize: 12.sp),
    );
  }

  Container addToCartButton() {
    return Container(
      width: double.infinity,
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment(-0.95, 0.0),
          end: Alignment(0.5, 0.0),
          colors: [Color(0xff1A2859), Color(0xff3F489E)],
          stops: [0.0, 1.5],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              onPrimary: mutedBlueColor,
              //side: BorderSide(width: 3.0, color: Colors.transparent,),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              primary: commonScaffoldBack),
          child: Text(
            'Add to cart',
            style: TextStyle(
                fontFamily: "Rubik", fontSize: 14.sp, color: textBlueColor),
          ),
        ),
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
