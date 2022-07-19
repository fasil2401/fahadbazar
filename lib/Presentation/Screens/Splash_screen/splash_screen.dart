import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkIn();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBackColor,
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/splash_background.svg',
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/fahad_logo.png')),
            ),
          )
        ],
      ),
    );
  }

 Future <void>checkIn() async{
   await Future.delayed(Duration(seconds: 2));
   Get.offNamed('/login');
  }
}
