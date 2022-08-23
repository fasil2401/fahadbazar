import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarService {
  static showErrorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.black87,
      icon: Icon(
        Icons.error,
        color: Colors.white,
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(10),
      duration: Duration(seconds: 2),
    );
  }
}
