import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_controller.dart';

class OtpVerificationController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  final CountdownController countdownController = CountdownController();

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
}
