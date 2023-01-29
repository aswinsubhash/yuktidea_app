import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yuktidea_ui/app/common/widgets/common_button_widget.dart';
import 'package:yuktidea_ui/app/common/widgets/common_sizedbox_widget.dart';
import 'package:yuktidea_ui/app/utils/app_colors.dart';
import 'package:yuktidea_ui/app/utils/app_string.dart';

import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/landing_page.png',
                ),
              ),
            ),
            height: double.infinity,
          ),
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  AppColors.kBlackColor.withOpacity(0.1),
                  AppColors.kBlackColor.withOpacity(0.8),
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    scale: 2.5,
                  ),
                  commonWidth(10),
                  Text(
                    AppString.appName,
                    style: TextStyle(
                      color: AppColors.kWhiteColor,
                      fontFamily: 'Posterama',
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                commonHeight(Get.height / 1.3),
                Text(
                  'YOUR ONE STOP SOLUTION TO',
                  style: TextStyle(
                    color: AppColors.kWhiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppString.fontFamily,
                  ),
                ),
                commonHeight(10),
                Text(
                  'Rent Pre-Production Equipments Easily',
                  style: TextStyle(
                    color: AppColors.kWhiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppString.fontFamily,
                  ),
                ),
                commonHeight(20),
                SizedBox(
                  width: 200,
                  height: 45,
                  child: CustomButton(
                    text: AppString.landiingButton,
                    onPressed: () {
                      controller.getStartedClick();
                    },
                    textColor: AppColors.kWhiteColor,
                    buttonColor: AppColors.kRedColor,
                    radius: 10,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
