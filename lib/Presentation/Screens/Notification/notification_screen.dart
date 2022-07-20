import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/Presentation/constants/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/Controller/api/notification_controller.dart';
import '../../Components/app_bar.dart';
import '../../Components/app_bar_text.dart';
import '../../constants/colors.dart';
import 'components/notification_shimmer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationController = Get.put(NotificationController());

  @override
  void initState() {
    // TODO: implement initState

    notificationController.getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: FahadAppBar(
          title: AppBarText(
            title: 'Notifications',
          ),
        ),
      ),
      body: AnimationLimiter(
        child: Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Obx(
            () => notificationController.notifications.length == 0
                ? NotificationShimmer(w: _w)
                : ListView.builder(
                    padding: EdgeInsets.all(_w / 30),
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: notificationController.notifications.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        delay: const Duration(milliseconds: 100),
                        child: SlideAnimation(
                          duration: const Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: const Duration(milliseconds: 2500),
                            child: Container(
                              margin: EdgeInsets.only(bottom: _w / 20),
                              // height: _w / 4,
                              decoration: BoxDecoration(
                                color: notificationTileColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 10,
                                    spreadRadius: 3,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.w, vertical: 3.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      notificationController
                                          .notifications.value[index].title,
                                      style: TextStyle(
                                        fontFamily: 'Rubik',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    commonHeight1,
                                    Text(
                                      notificationController
                                          .notifications.value[index].subTitle,
                                      style: TextStyle(
                                          fontFamily: 'Rubik',
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    commonHeight1,
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        notificationController.notifications
                                            .value[index].createdAt
                                            .toString(),
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
      ),
    );
  }
}
