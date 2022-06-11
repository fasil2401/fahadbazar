import 'package:fahadbazar/Presentation/Components/drawer_custom.dart';
import 'package:fahadbazar/Presentation/Screens/Account/account_screen.dart';
import 'package:fahadbazar/Presentation/Screens/Categories/category_screen.dart';
import 'package:fahadbazar/Presentation/Screens/Home/home_screen.dart';
import 'package:fahadbazar/Presentation/Screens/Notification/notification_screen.dart';
import 'package:fahadbazar/logic/Controller/ui_controls/bottom_navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/bottomnavigation.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = [
    HomeScreen(),
    CategoryScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final statusController = Get.put(BottomNavigationController());
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ValueListenableBuilder(
              valueListenable: MainScreen.selectedIndexNotifier,
              builder: (BuildContext context, int updatedInddex, child) {
                return _pages[updatedInddex];
              },
            ),
            Obx(
              () => Visibility(
                visible: statusController.status.value,
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomBottomNavigationBar(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
