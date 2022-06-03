import 'package:fahadbazar/Presentation/Screens/Login_page/login.dart';
import 'package:fahadbazar/Presentation/Screens/OTPverification/verification.dart';
import 'package:fahadbazar/Presentation/Screens/Register_page/register.dart';
import 'package:fahadbazar/Presentation/Screens/Reset_password/reset_password.dart';
import 'package:fahadbazar/Presentation/Screens/Splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
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
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => SplashScreen()),
            GetPage(name: '/login', page: () => LoginScreen(),
            transition: Transition.cupertino
            ),
            GetPage(name: '/register', page: () => RegisterScreen(),
            transition: Transition.cupertino
            ),
            GetPage(name: '/verification', page: () => VerificationScreen(),
            transition: Transition.cupertino
            ),
            GetPage(name: '/reset', page: () => ResetScreen(),
            transition: Transition.cupertino
            ),
            
            ],
        );
      },
    );
  }
}
