import 'package:get/get.dart';
import 'package:yuktidea_ui/app/modules/auth/otp_verification/controllers/otp_verification_controller.dart';

import '../controllers/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
    Get.lazyPut<OtpVerificationController>(
      () => OtpVerificationController(),
    );
  }
}
