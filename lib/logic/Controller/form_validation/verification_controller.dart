import 'package:fahadbazar/logic/Controller/api/register_verify_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register_controler.dart';

class VerificationController extends GetxController {
  final verifyApicontrol = Get.put(VerifyController());
  final registerControl = Get.put(RegisterController());
  var otp = false.obs;
  var create = false.obs;
  var confirm = false.obs;
  var otpControl = '';
  var createControl = '';
  var confirmControl = '';

  validateOtp(String value) {
    if (value.length != 4) {
      otp.value = true;
    } else {
      otp.value = false;
      otpControl = value;
    }
  }

  validateCreate(String value) {
    if (value.length < 8) {
      create.value = true;
    } else {
      create.value = false;
      createControl = value;
    }
  }

  validateConfirm(String value) {
    if (value != createControl) {
      confirm.value = true;
    } else {
      confirm.value = false;
      confirmControl = value;
    }
  }

  checkRegisterForm() {
    if (otp.value == false &&
        create.value == false &&
        confirm.value == false &&
        otpControl.isNotEmpty &&
        createControl.isNotEmpty &&
        confirmControl.isNotEmpty) {

      // Get.toNamed('/login');
      verifyApicontrol.getVerify(name: registerControl.nameControl, password: confirmControl, phone: registerControl.phoneControl, email: registerControl.emailControl, otp: otpControl);
    } else {
      Get.snackbar('Warning!', 'Please complete the form');
    }
  }
}
