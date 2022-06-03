import 'package:fahadbazar/Presentation/constants/colors.dart';
import 'package:fahadbazar/Presentation/constants/heights.dart';
import 'package:fahadbazar/logic/Controller/form_validation/register_controler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_rich_text/easy_rich_text.dart';

import '../../Components/error_text.dart';
import '../Login_page/components/login_button.dart';
import '../Login_page/components/welcome_sub.dart';
import '../Login_page/components/welcome_text.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final formContrler = Get.put(RegisterController());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
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
                  title: 'Registration',
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
                  controller: _nameController,
                  onChanged: (value) {
                    formContrler.validateName(value);                  
                  },
                ),
                 Obx(
                   ()=> ErrorText(
                    title: 'Name should be atleast 3 letters',
                    isVisible: formContrler.name.value,
                                 ),
                 ),              
                commonHeight2,
                CupertinoTextField(
                  decoration: BoxDecoration(
                    color: textFieldColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  style: TextStyle(fontSize: 16.sp),
                  placeholder: 'Enter Your mail',
                  placeholderStyle: TextStyle(
                      color: CupertinoColors.placeholderText,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w200,
                      fontSize: 14.sp),
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  prefix: Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: SvgPicture.asset(
                      'assets/icons/mail.svg',
                      height: 16.sp,
                    ),
                  ),
                  controller: _emailController,
                  onChanged: (value){
                    formContrler.validateEmail(value);
                  },
                ),
                 Obx(
                   ()=> ErrorText(
                    title: 'Enter valid Email',
                    isVisible: formContrler.email.value,
                                 ),
                 ),
                commonHeight2,
                CupertinoTextField(
                  decoration: BoxDecoration(
                    color: textFieldColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  keyboardType: TextInputType.phone,
                  style: TextStyle(fontSize: 16.sp),
                  placeholder: 'Enter Your Phone',
                  placeholderStyle: TextStyle(
                      color: CupertinoColors.placeholderText,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w200,
                      fontSize: 14.sp),
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  prefix: Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: SvgPicture.asset(
                      'assets/icons/phone.svg',
                      height: 16.sp,
                    ),
                  ),
                  controller: _phoneController,
                  onChanged: (value){
                    formContrler.validatePhone(value);
                  },
                ),
                 Obx(
                   ()=> ErrorText(
                    title: 'Enter valid Mobile number',
                    isVisible: formContrler.phone.value,
                                 ),
                 ),
                commonHeight4,
                LoginButton(title: 'Continue', callback: 'register'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 70.w,
                        child: EasyRichText(
                          'Already Registered ? Sign In',
                          textAlign: TextAlign.center,
                          defaultStyle: TextStyle(
                              fontFamily: 'Rubik',
                              color: mutedColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w100),
                          patternList: [
                            EasyRichTextPattern(
                                targetString: 'Sign In',
                                style: const TextStyle(
                                    color: mutedBlueColor,
                                    fontWeight: FontWeight.w400),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed('/login');
                                  }),
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
