import 'package:fahadbazar/Presentation/Screens/Account/components/account_name.dart';
import 'package:fahadbazar/Presentation/constants/border_radius.dart';
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:fahadbazar/Services/User%20Preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: commonScaffoldBack,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Column(
          children: [
            commonHeight3,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: mutedBackColor, borderRadius: cartRadius * 1.6),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
                child: drawerHead(),
              ),
            ),
            commonHeight5,
            DrawerTile(
              title: 'My orders',
              iconUrl: 'assets/icons/drawer/orders.svg',
              route: 'orders',
              onTap: () {
                Get.back();
                Get.toNamed('orders');
              },
            ),
            commonHeight4,
            DrawerTile(
              title: 'My Address',
              iconUrl: 'assets/icons/drawer/my_address.svg',
              route: 'address',
              onTap: () {
                Get.back();
                Get.toNamed('address');
              },
            ),
            commonHeight4,
            DrawerTile(
              title: 'Select pincode',
              iconUrl: 'assets/icons/drawer/select_pincode.svg',
              onTap: () {
                Get.back();
              },
            ),
            commonHeight4,
            DrawerTile(
              title: 'Logout',
              iconUrl: 'assets/icons/drawer/logout.svg',
              onTap: () async {
                await UserSimplePreferences.setLogin('false');
                await Get.offAllNamed('/login');
              },
            ),
            commonHeight3,
            const Divider(),
            commonHeight3,
            DrawerTile(
              title: 'Contact Us',
              iconUrl: 'assets/icons/drawer/contactus.svg',
              onTap: () {
                Get.back();
              },
            ),
            commonHeight4,
            DrawerTile(
              title: 'About us',
              iconUrl: 'assets/icons/drawer/about.svg',
              onTap: () {
                Get.back();
              },
            ),
            commonHeight4,
            DrawerTile(
              title: 'Terms & conditions',
              iconUrl: 'assets/icons/drawer/terms.svg',
              onTap: () {
                Get.back();
              },
            ),
            commonHeight4,
            DrawerTile(
              title: 'Privacy policy',
              iconUrl: 'assets/icons/drawer/privacy.svg',
              onTap: () {
                Get.back();
              },
            ),
            commonHeight4,
            DrawerTile(
              title: 'Return policy',
              iconUrl: 'assets/icons/drawer/return.svg',
              onTap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  Row drawerHead() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 7.w,
          backgroundImage: const AssetImage('assets/images/user.png'),
        ),
        SizedBox(
          width: 3.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 34.w,
              child: Text(
                UserSimplePreferences.getUsername() ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            commonHeight1,
            SizedBox(
              width: 32.w,
              child: Text(
                UserSimplePreferences.getUserEmail() ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title;
  final String iconUrl;
  final String route;
  final Function() onTap;
  const DrawerTile({
    Key? key,
    required this.title,
    required this.iconUrl,
    this.route = '',
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(iconUrl),
          SizedBox(
            width: 5.w,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 12.sp,
                fontWeight: FontWeight.w100),
          ),
        ],
      ),
    );
  }
}
