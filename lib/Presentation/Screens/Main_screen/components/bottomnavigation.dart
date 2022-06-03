import 'package:fahadbazar/Presentation/Screens/Main_screen/main_screen.dart';
import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.08,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25)),
        // boxShadow: [
        //   BoxShadow(color: Colors.black, blurRadius: 0.1),
        // ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: ValueListenableBuilder(
          valueListenable: MainScreen.selectedIndexNotifier,
          builder: (BuildContext ctx, int updatedIndex, _) {
            return BottomNavigationBar(
              // backgroundColor: Colors.white,
              // elevation: 0,
              currentIndex: updatedIndex,
              onTap: (newIndex) {
                MainScreen.selectedIndexNotifier.value = newIndex;
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: textBlueColor,
              selectedLabelStyle: TextStyle(
                fontSize: 9.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Rubik'
              ),
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              iconSize: 25,
              items: [
                 BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/navigation/home.svg'),
                  label: 'home',
                  activeIcon: SvgPicture.asset('assets/icons/navigation/home_select.svg'),
                ),
                 BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/navigation/category.svg'),
                  activeIcon: SvgPicture.asset('assets/icons/navigation/category_select.svg'),
                  label: 'categories',
                ),
                 BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/navigation/notify.svg'),
                  label: 'notifications',
                  activeIcon: SvgPicture.asset('assets/icons/navigation/notify_select.svg'),
                ),
                 BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/navigation/profile.svg'),
                  label: 'account',
                  activeIcon: SvgPicture.asset('assets/icons/navigation/profile_select.svg'),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
