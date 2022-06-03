import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
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
    if (value.length < 10) {
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
      Get.toNamed('/verification');
    } else {
      Get.snackbar('Warning!', 'Please complete the form');
    }
  }
}
