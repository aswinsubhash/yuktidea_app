import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yuktidea_ui/app/utils/app_colors.dart';
import 'package:yuktidea_ui/app/utils/app_string.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextLiquidFill(
              loadDuration: const Duration(seconds: 2),
              text: AppString.appName,
              waveColor: AppColors.kWhiteColor,
              boxBackgroundColor: AppColors.kBackgroundColor,
              textStyle: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Posterama',
              ),
              boxHeight: 300.0,
            ),
          ],
        ),
      ),
    );
  }
}
