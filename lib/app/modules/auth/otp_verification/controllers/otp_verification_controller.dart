import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:yuktidea_ui/app/modules/auth/otp_verification/api/verify_otp_api.dart';
import 'package:yuktidea_ui/app/modules/auth/otp_verification/model/otp_verify_model.dart';
import 'package:yuktidea_ui/app/modules/home/views/home_view.dart';
import 'package:yuktidea_ui/app/utils/app_snackbar_widget.dart';

class OtpVerificationController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  final CountdownController countdownController = CountdownController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final storage = FlutterSecureStorage();

  var otp = ''.obs;

  @override
  void onReady() {
    countdownController.start();
    super.onReady();
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }

  Future<void> onVefifyClick() async {

    if (formKey.currentState!.validate()) {
      log(otp.value);
      OtpVerificationModel? response =
          await OtpVerificationAPI().verifyOtpService(
        otp.value,
      );
      if (response != null) {
        if (response.status == true) {
          AppSnackbars.welcomeSnackBar(
            message: response.message!,
            title: 'Welcome to CINE COMPASS',
          );
          final token = await storage.read(key: 'token');
          await storage.write(key: 'login_key', value: token);
          Get.offAll(() => HomeView());
        } else {
          AppSnackbars.showErrorSnackBar(
            message: 'Invalid OTP',
          );
        }
      }
    }
  }
}
