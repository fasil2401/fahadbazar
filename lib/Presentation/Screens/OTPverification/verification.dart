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
import '../Login_page/components/login_button.dart';
import '../Login_page/components/welcome_text.dart';

class VerificationScreen extends StatelessWidget {
   VerificationScreen({Key? key}) : super(key: key);
final passwordController = Get.find<PasswordController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commonScaffoldBack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: SizedBox(
              height: 100.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 4.h),
                    child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: SvgPicture.asset(
                            'assets/icons/circled_back.svg',
                            height: 18.sp,
                            color: splashBackColor,
                          ),
                    ),
                  ),
                      SizedBox(height: 11.h,),
                  const WelcomeText(
                    title: 'Phone Verification',
                  ),
                  commonHeight1,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 70.w,
                      child: EasyRichText(
                        'Enter the 6-digit confirmation code we sent to +91 ***** **96. Request new one',
                        textAlign: TextAlign.start,
                        defaultStyle: TextStyle(
                            fontFamily: 'Rubik',
                            color: mutedColor,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400),
                        patternList: [
                          EasyRichTextPattern(
                              targetString: 'Terms & Conditions',
                              style: const TextStyle(
                                  color: textBlueColor,
                                  fontWeight: FontWeight.w600),
                              recognizer: TapGestureRecognizer()..onTap = () {}),
                          EasyRichTextPattern(
                              targetString: 'Request new one',
                              style: const TextStyle(
                                  color: textBlueColor,
                                  fontWeight: FontWeight.w600),
                              recognizer: TapGestureRecognizer()..onTap = () {}),
                        ],
                      ),
                    ),
                  ),
                  commonHeight5,
                  CupertinoTextField(
                    decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    style: TextStyle(fontSize: 16.sp),
                    keyboardType: TextInputType.number,
                    placeholder: 'Enter OTP',
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
                  ),
                  commonHeight2,
                  CupertinoTextField(
                    decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Create Password',
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
                  ),
                  commonHeight2,
                  Obx(
                  ()=> CupertinoTextField(
                    decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    style: TextStyle(fontSize: 16.sp),
                    placeholder: 'Re-enter your Password',
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
                  commonHeight4,
                  LoginButton(
                    title: 'Register',
                    callback: 'verification',
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
