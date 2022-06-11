import 'package:fahadbazar/logic/Controller/api/login_controller.dart';
import 'package:fahadbazar/logic/Controller/api/register_otp_controller.dart';
import 'package:fahadbazar/logic/Controller/form_validation/login_control.dart';
import 'package:fahadbazar/logic/Controller/form_validation/register_controler.dart';
import 'package:fahadbazar/logic/Controller/form_validation/reset_controler.dart';
import 'package:fahadbazar/logic/Controller/form_validation/verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final String callback;
  final String emailorphone;
  final String password;
  final String phone;
  final String email;
  final String otp;
  LoginButton(
      {Key? key,
      required this.title,
      required this.callback,
      this.email = '',
      this.emailorphone = '',
      this.otp = '',
      this.password = '',
      this.phone = ''})
      : super(key: key);
  final registerController = Get.put(RegisterController());
  final verifyController = Get.put(VerificationController());
  final resetController = Get.put(ResetController());
  final loginApiController = Get.put(LoginController());
  // final registerApiControl = Get.put(RegisterOtpController());
  final loginControl = Get.put(LoginFormControl());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.5.h,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: textBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // <-- Radius
          ),
        ),
        onPressed: () {
          if (callback == 'login') {
            loginApiController.getLogin(emailorphone: loginControl.emailorphoneControl, password: loginControl.passwordControl);

            // Get.toNamed('/main');
          } else if (callback == 'continue') {
            registerController.checkRegisterForm();
          } else if (callback == 'verification') {
            verifyController.checkRegisterForm();
          } else if (callback == 'reset') {
            resetController.checkRegisterForm();
          }
        },
        child: Text(
          title,
          style: TextStyle(
            color: textFieldColor,
            fontSize: 16.sp,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
