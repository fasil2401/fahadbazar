import 'package:fahadbazar/Presentation/Screens/support/components/support_tile.dart';
import 'package:fahadbazar/Presentation/constants/border_radius.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../Components/appbar_inner.dart';
import '../../constants/colors.dart';
import 'components/order_button.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    // final double sh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarInner(
          title: 'My orders',
          visible: false,
          cart: false,
        ),
      ),
      body: Padding(
        padding: commonHorizontalPadding,
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                
                Container(
                  decoration: BoxDecoration(
                    borderRadius: cartRadius,
                    color: Colors.white70
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.w),
                    child: Padding(
                      padding:  EdgeInsets.only(top: 4.w),
                      child: Row(
                        children: [
                          Container(
                            height: sw * 0.18,
                            width: sw * 0.18,
                            decoration: BoxDecoration(
                                borderRadius: cartRadius,
                                image:const DecorationImage(
                                    image:
                                        AssetImage('assets/images/profile.jpeg'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Expanded(child: productDetails(sw)),
                          Column(
                            children: [
                              const OrderButton(title: 'Cash pending', container: Colors.amber),
                              commonHeight1,
                             GestureDetector(child: const OrderButton(title: 'Cancel order', container: Colors.red,)),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: textBlueColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.w),
                      child: Text('#139',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp
                      ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return commonHeight2;
          },
        ),
      ),
    );
  }







  Column productDetails(double sw) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: sw * 0.4,
          child: Text(
            'Baby powder',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontFamily: 'Rubik', fontSize: 12.sp),
          ),
        ),
        Text(
          '12/02/2020 | 09:40AM',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: 'Rubik', fontSize: 8.sp, color: mutedColor),
        ),
        Text(
          'your order has been placed',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: 'Rubik', fontSize: 7.sp, color: Colors.green),
        ),
        
        Text(
          '₹540',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 12.sp,
              color: Colors.green,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
