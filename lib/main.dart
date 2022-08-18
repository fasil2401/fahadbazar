import 'package:fahadbazar/Presentation/Screens/Aboutus/about.dart';
import 'package:fahadbazar/Presentation/Screens/Add%20Address/add_address.dart';
import 'package:fahadbazar/Presentation/Screens/Addresses/address_empty.dart';
import 'package:fahadbazar/Presentation/Screens/Addresses/addresses.dart';
import 'package:fahadbazar/Presentation/Screens/Edit%20Profile/edit_profile.dart';
import 'package:fahadbazar/Presentation/Screens/Login_page/login.dart';
import 'package:fahadbazar/Presentation/Screens/Main_screen/main_screen.dart';
import 'package:fahadbazar/Presentation/Screens/Notification/notification_inner.dart';
import 'package:fahadbazar/Presentation/Screens/OTPverification/verification.dart';
import 'package:fahadbazar/Presentation/Screens/Orders/my_order.dart';
import 'package:fahadbazar/Presentation/Screens/Register_page/register.dart';
import 'package:fahadbazar/Presentation/Screens/Reset_password/reset_password.dart';
import 'package:fahadbazar/Presentation/Screens/Search%20page/search_page.dart';
import 'package:fahadbazar/Presentation/Screens/Single%20Page/single_page.dart';
import 'package:fahadbazar/Presentation/Screens/Splash_screen/splash_screen.dart';
import 'package:fahadbazar/Presentation/Screens/cart%20screen/cart.dart';
import 'package:fahadbazar/Presentation/Screens/product%20list/product_list.dart';
import 'package:fahadbazar/Presentation/Screens/support/support_screen.dart';
import 'package:fahadbazar/models/Address/address_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'Presentation/Screens/cart screen/cart_empty.dart';
import 'Services/User Preferences/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSimplePreferences.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            
            fontFamily: 'Rubik',
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          getPages: [
            GetPage(
                name: '/',
                page: () => SplashScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/login',
                page: () => LoginScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/register',
                page: () => RegisterScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/verification',
                page: () => VerificationScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/reset',
                page: () => ResetScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/main',
                page: () => MainScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/search',
                page: () => SearchScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/products',
                page: () => ProductList(),
                transition: Transition.cupertino),
            GetPage(
                name: '/single',
                page: () => SinglePage(),
                transition: Transition.cupertino),
            GetPage(
                name: '/cart',
                page: () => CartScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/cartempty',
                page: () => CartEmptyScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/address',
                page: () => AddressScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/addressempty',
                page: () => AddressEmptyScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/add_address',
                page: () => AddAddress(
                      address: Address(),
                      status: "",
                    ),
                transition: Transition.cupertino),
            GetPage(
                name: '/support',
                page: () => SupportScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/orders',
                page: () => OrderListScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/notification',
                page: () => NotificationInnerScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/about',
                page: () => AboutScreen(),
                transition: Transition.cupertino),
            GetPage(
                name: '/editprofile',
                page: () => EditProfileScreen(),
                transition: Transition.cupertino),
          ],
        );
      },
    );
  }
}
