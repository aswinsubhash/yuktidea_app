import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yuktidea_ui/app/common/widgets/common_button_widget.dart';
import 'package:yuktidea_ui/app/common/widgets/common_sizedbox_widget.dart';
import 'package:yuktidea_ui/app/utils/app_colors.dart';

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
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.8),
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 50,
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      scale: 2.5,
                    ),
                    commonWidth(10),
                    Text(
                      'CINE COMPASS',
                      style: TextStyle(
                        color: AppColors.kWhiteColor,
                        fontFamily: 'Posterama',
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                commonHeight(Get.height / 1.5),
                Text(
                  'YOUR ONE STOP SOLUTION TO',
                  style: TextStyle(
                    color: AppColors.kWhiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                commonHeight(10),
                Text(
                  'Rent Pre-Production Equipments Easily',
                  style: TextStyle(
                    color: AppColors.kWhiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                commonHeight(20),
                SizedBox(
                  width: 200,
                  height: 45,
                  child: CustomButton(
                    text: 'Get Started',
                    onPressed: (){
                      controller.getStartedClick();
                    },
                    textColor: AppColors.kWhiteColor,
                    buttonColor: AppColors.kRedColor,
                    radius: 10,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
