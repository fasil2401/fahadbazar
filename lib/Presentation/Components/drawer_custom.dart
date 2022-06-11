
import 'package:fahadbazar/Presentation/constants/border_radius.dart';
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/paddings.dart';
import 'package:flutter/material.dart';
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
             height: 15.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: mutedBackColor,
              borderRadius: cartRadius*1.6
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 9.w,
                  backgroundImage:const AssetImage('assets/images/user.png'),
                ),
                SizedBox(width: 3.w,)
              ],
            ),
           ),
           ListTile(
             title: const Text('Item 1'),
             onTap: () {
               Navigator.pop(context);
             },
           ),
           ListTile(
             title: const Text('Item 2'),
             onTap: () {
               Navigator.pop(context);
             },
           ),
           ListTile(
             title: const Text('Item 2'),
             onTap: () {
               // Update the state of the app
               // ...
               // Then close the drawer
               Navigator.pop(context);
             },
           ),
         ],
       ),
     ),
      );
  }
}
