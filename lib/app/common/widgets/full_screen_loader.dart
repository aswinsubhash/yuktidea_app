import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:yuktidea_ui/app/utils/app_colors.dart';

class FullScreenDialogLoader {
  static void showLoading() {
    Get.dialog(
      Center(
        child: SpinKitSquareCircle( 
          color: AppColors.kRedColor,
        ),
      ),
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}