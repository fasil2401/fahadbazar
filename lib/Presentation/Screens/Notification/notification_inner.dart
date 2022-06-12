import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sizer/sizer.dart';

import '../../Components/appbar_inner.dart';
import '../../constants/colors.dart';

class NotificationInnerScreen extends StatelessWidget {
  const NotificationInnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarInner(
          title: 'Notifications',
          visible: false,
          cart: false,
        ),
      ),
         body: AnimationLimiter(
        child: Padding(
          padding:  EdgeInsets.only(bottom: 5.h),
          child: ListView.builder(
            padding: EdgeInsets.all(_w / 30),
            physics:
               const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: notifyContent.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                
                position: index,
                delay:const Duration(milliseconds: 100),
                child: SlideAnimation(
                  
                  duration:const Duration(milliseconds: 2500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration:const Duration(milliseconds: 2500),
                    child: Container(
                      margin: EdgeInsets.only(bottom: _w / 20),
                      // height: _w / 4,
                      decoration: BoxDecoration(
                        color: notificationTileColor,
                        borderRadius:const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 40,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(notifyHeads[index],
                              style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            commonHeight1,
                            Text(notifyContent[index],
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400
                            ),
                            ),
                            commonHeight1,
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text('2021-10-23 13:20:00',
                              style: TextStyle(
                                color: mutedColor,
                                fontFamily: 'Rubik',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}