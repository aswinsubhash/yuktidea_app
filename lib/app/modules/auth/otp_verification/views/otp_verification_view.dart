import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:yuktidea_ui/app/common/widgets/common_button_widget.dart';
import 'package:yuktidea_ui/app/common/widgets/common_sizedbox_widget.dart';
import 'package:yuktidea_ui/app/utils/app_colors.dart';
import 'package:yuktidea_ui/app/utils/app_string.dart';

import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  AppString.verifyScreenTitle,
                  style: TextStyle(
                    color: AppColors.kWhiteColor,
                    fontFamily: AppString.fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                commonHeight(10),
                Text(
                  AppString.verifyScreenSubtitle,
                  style: TextStyle(
                    color: AppColors.kWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: AppString.fontFamily,
                  ),
                ),
                commonHeight(Get.height / 4),
                Form(
                  key: controller.formKey,
                  child: PinCodeTextField(
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Please enter OTP';
                      }else if(value.length < 4){
                        return 'OTP must be 4 digits';
                      }
                      return null;
                    },
                    appContext: context,
                    length: 4,
                    onChanged: (value) {
                      controller.otp.value = value;
                    },
                    animationType: AnimationType.none,
                    showCursor: false,
                    enableActiveFill: true,
                   
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kWhiteColor,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 60,
                      fieldWidth: 60,
                      inactiveColor: AppColors.kBlackColor,
                      inactiveFillColor: AppColors.kBlackColor,
                      activeFillColor: AppColors.kBlackColor,
                      activeColor: AppColors.kBlackColor,
                      selectedFillColor: AppColors.kBlackColor,
                      selectedColor: AppColors.kRedColor,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                commonHeight(10),
                Countdown(
                  controller: controller.countdownController,
                  seconds: 10,
                  build: (
                    _,
                    currentRemainingTime,
                  ) {
                    if (currentRemainingTime == 0.0) {
                      return GestureDetector(
                        onTap: (){
                          
                        },
                        child: Text(
                          'OTP Resent!',
                          style: TextStyle(
                            color: AppColors.kWhiteColor,
                            fontFamily: AppString.fontFamily,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Resend OTP in ',
                            style: TextStyle(
                              color: AppColors.kWhiteColor,
                              fontFamily: AppString.fontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            currentRemainingTime.toString().length == 4
                                ? currentRemainingTime
                                    .toString()
                                    .substring(0, 2)
                                : currentRemainingTime
                                    .toString()
                                    .substring(0, 1),
                            style: TextStyle(
                              color: AppColors.kRedColor,
                              fontFamily: AppString.fontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' seconds',
                            style: TextStyle(
                              color: AppColors.kRedColor,
                              fontFamily: AppString.fontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
                commonHeight(Get.height / 4.1),
                SizedBox(
                  width: 200,
                  child: CustomButton(
                    text: AppString.verifyButton,
                    onPressed: () {
                      controller.onVefifyClick();
                    },
                    textColor: AppColors.kWhiteColor,
                    buttonColor: AppColors.kRedColor,
                    radius: 8,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
