import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbars{
  static void showErrorSnackBar({
    required String message,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        backgroundColor: Color.fromRGBO(255, 0, 0,1.0),
        duration: Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
      ),
    );
  }

    static void showSuccessSnackBar({
    required String message,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        backgroundColor: Color.fromRGBO(0,255,0, 1.0),
        duration: Duration(seconds: 3),
        snackStyle: SnackStyle.FLOATING,
      ),
    );
  }
}