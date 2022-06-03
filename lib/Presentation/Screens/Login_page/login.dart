import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import '../../../logic/Controller/ui_controls/password_controller.dart';
import 'components/login_button.dart';
import 'components/welcome_sub.dart';
import 'components/welcome_text.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

final passwordController = Get.put(PasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SizedBox(
            height: 100.h,
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                const WelcomeText(
                  title: 'Welcome to Fahad Bazar',
                ),
                commonHeight1,
                const WelcomeSub(
                  title: 'Log in',
                ),
                commonHeight5,
                CupertinoTextField(
                  decoration: BoxDecoration(
                    color: textFieldColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  style: TextStyle(fontSize: 16.sp),
                  placeholder: 'Enter Your Name',
                  placeholderStyle: TextStyle(
                      color: CupertinoColors.placeholderText,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w200,
                      fontSize: 14.sp),
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  prefix: Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: SvgPicture.asset(
                      'assets/icons/user.svg',
                      height: 16.sp,
                    ),
                  ),
                ),
                commonHeight2,
                Obx(
                  ()=> CupertinoTextField(
                    decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Enter Your Password',
                    obscureText: passwordController.status.value,
                    placeholderStyle: TextStyle(
                        color: CupertinoColors.placeholderText,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w200,
                        fontSize: 14.sp),
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    prefix: Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: SvgPicture.asset(
                        'assets/icons/password.svg',
                        height: 16.sp,
                      ),
                    ),
                    suffix: InkWell(
                      onTap: (){
                        passwordController.check();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 4.w),
                        child: SvgPicture.asset(
                          passwordController.icon.value,
                          height: passwordController.status.value == true ? 7.sp : 10.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                commonHeight2,
                InkWell(
                  onTap: (){
                    Get.toNamed('/reset');
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Reset Password ?',
                      style: TextStyle(
                        color: textBlueColor,
                        fontSize: 10.sp,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                commonHeight2,
                LoginButton(
                  title: 'Log in',
                  callback: 'login',
                ),
                commonHeight2,
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 70.w,
                    child: EasyRichText(
                      'By continuing, you agree to our Terms & Conditions and Privacy Policy',
                      textAlign: TextAlign.center,
                      defaultStyle: TextStyle(
                          fontFamily: 'Rubik',
                          color: mutedColor,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400),
                      patternList: [
                        EasyRichTextPattern(
                          targetString: 'Terms & Conditions',
                          style:const TextStyle(
                              color: textBlueColor, fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()..onTap =(){}
                        ),
                        EasyRichTextPattern(
                          targetString: 'Privacy Policy',
                          style:const TextStyle(
                              color: textBlueColor, fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()..onTap =(){}
                        ),
                      ],
                    ),
                  ),
                ),
                
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.only(bottom: 20),
                   child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 70.w,
                        child: EasyRichText(
                          'Not Registered ? Register',
                          textAlign: TextAlign.center,
                          defaultStyle: TextStyle(
                              fontFamily: 'Rubik',
                              color: mutedColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w100),
                          patternList: [
                            EasyRichTextPattern(
                              targetString: 'Register',
                              style:const TextStyle(
                                  color: mutedBlueColor, fontWeight: FontWeight.w400),
                              recognizer: TapGestureRecognizer()..onTap =(){Get.toNamed('/register');}
                            ),
                          ],
                        ),
                      ),
                    ),
                 ),
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
