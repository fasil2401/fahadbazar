import 'package:fahadbazar/Presentation/Components/section_head.dart';
import 'package:fahadbazar/Presentation/Screens/support/components/support_tile.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/notifications.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../Components/appbar_inner.dart';
import '../../Components/positioned_bitton.dart';
import '../../constants/colors.dart';

class CartEmptyScreen extends StatelessWidget {
  const CartEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarInner(
          title: 'Cart',
          visible: false,
          cart: false,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              child: Image.asset('assets/images/cart_empty.png'),
            ),
          ),
          Text(
            'Your cart is\nEmpty!!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          commonHeight3,
          Container(
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
              padding:  EdgeInsets.symmetric(horizontal: 5.w),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.transparent,
                    //side: BorderSide(width: 3.0, color: Colors.transparent,),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    primary: Colors.transparent),
                child: Text(
                  'Start shopping',
                  style: TextStyle(
                      fontFamily: "Rubik",
                      fontSize: 12.sp,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
