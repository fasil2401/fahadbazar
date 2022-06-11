import 'package:fahadbazar/logic/Controller/api/credential_control.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/register_otp_controller.dart';

class RegisterController extends GetxController {
  final registerApiControl = Get.put(RegisterOtpController());
  // final registerApiControl = Get.find<RegisterOtpController>();
  final credentialController = Get.put(CredentialCheckController());
  var name = false.obs;
  var email = false.obs;
  var phone = false.obs;
  var nameControl = '';
  var emailControl = '';
  var phoneControl = '';

  validateName(String value) {
    if (value.length < 3) {
      name.value = true;
    } else {
      name.value = false;
      nameControl = value;
    }
  }

  validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      email.value = true;
    } else {
      email.value = false;
      emailControl = value;
    }
  }

  validatePhone(String value) {
    if (value.length != 10) {
      phone.value = true;
    } else {
      phone.value = false;
      phoneControl = value;
    }
  }

  checkRegisterForm() {
    if (name.value == false &&
        email.value == false &&
        phone.value == false &&
        nameControl.isNotEmpty &&
        emailControl.isNotEmpty &&
        phoneControl.isNotEmpty) {
      // Get.toNamed('/verification');
      // registerApiControl.getRegisterOtp(
      //     name: nameControl, email: emailControl, phone: phoneControl);
      credentialController.getCredentiaStatusEmail(email: emailControl);
    } else {
      Get.snackbar('Warning!', 'Please complete the form');
    }
  }
}
