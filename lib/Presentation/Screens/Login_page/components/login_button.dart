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
  LoginButton({Key? key, required this.title, required this.callback})
      : super(key: key);
  final registerController = Get.put(RegisterController());
  final verifyController = Get.put(VerificationController());
  final resetController = Get.put(ResetController());
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
          } 
          else if (callback == 'continue') {
            registerController.checkRegisterForm();
          } 
          else if (callback == 'verification') {
            verifyController.checkRegisterForm();
          }
          else if(callback =='reset'){
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
