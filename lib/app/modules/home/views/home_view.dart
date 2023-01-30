import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yuktidea_ui/app/common/widgets/common_sizedbox_widget.dart';
import 'package:yuktidea_ui/app/utils/app_colors.dart';
import 'package:yuktidea_ui/app/utils/app_string.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBackgroundColor,
        elevation: 0,
         actions: [
          GestureDetector(
            onTap: (){
              controller.logout();
            },
            child: Icon(
              Icons.logout,
             // color: AppColor.blackColor,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              scale: 2,
            ),
          commonHeight(10),
            Text(
              AppString.appName,
              style: TextStyle(
                color: AppColors.kWhiteColor,
                fontFamily: AppString.appNameFontFamily,
                fontSize: 20,
              ),
            ),
            commonHeight(20),
            Text(
              'HOME',
              style: TextStyle(
                color: AppColors.kWhiteColor,
                fontFamily: AppString.fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          commonHeight(250)
          ],
        ),
      ),
    );
  }
}
