import 'package:fahadbazar/Presentation/Components/section_head.dart';
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'components/account_head.dart';
import 'components/information_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      body: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: Padding(
          padding:  EdgeInsets.only(bottom: 8.h),
          child: ListView(
            physics:const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: const AccountHead(),
              ),
              commonHeight5,
              Text(
                'Your informations',
                style: TextStyle(
                    fontFamily: 'Rubik', fontSize: 15.sp, color: mutedColor),
              ),
              commonHeight2,
             const InformationTile(title: 'Order History', url: 'assets/icons/account/order_history.svg', route: '/orders',),
             commonHeight2,
             const InformationTile(title: 'Address book', url: 'assets/icons/account/address_book.svg',route: '/address',),
             commonHeight2,
             const InformationTile(title: 'Edit profile', url: 'assets/icons/account/edit.svg',),
             commonHeight2,
             const InformationTile(title: 'Notifications', url: 'assets/icons/account/notification.svg',route: '/notification',),
             commonHeight2,
              Text(
                'Others',
                style: TextStyle(
                    fontFamily: 'Rubik', fontSize: 15.sp, color: mutedColor),
              ),
              commonHeight2,
             const InformationTile(title: 'Support', url: 'assets/icons/account/support.svg',route: '/support',),
             commonHeight2,
             const InformationTile(title: 'Share the app', url: 'assets/icons/account/share.svg',),
             commonHeight2,
             const InformationTile(title: 'About us', url: 'assets/icons/account/about.svg',route: '/about',),
             commonHeight2,
             const InformationTile(title: 'Change password', url: 'assets/icons/account/change_pass.svg',),
             commonHeight2,
             const InformationTile(title: 'logout', url: 'assets/icons/account/logout.svg',),
             commonHeight5
            ],
          ),
        ),
      ),
    );
  }
}
