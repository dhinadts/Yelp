
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utility {
  void toastMessage(String? title, String? message, Color? color) {
    Get.snackbar(
      title!,
      message!,
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      borderRadius: 10,
      backgroundColor: color,
    );
  }
}
