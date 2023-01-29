import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:yuktidea_ui/app/modules/home/views/home_view.dart';
import 'package:yuktidea_ui/app/utils/app_snackbar_widget.dart';

class OtpVerificationController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  final CountdownController countdownController = CountdownController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  void onVefifyClick() {
    if (formKey.currentState!.validate()) {
      Get.off(()=>HomeView());
    }
  }
}
