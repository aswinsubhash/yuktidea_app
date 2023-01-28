import 'package:get/get.dart';
import 'package:yuktidea_ui/app/modules/auth/login/controllers/login_controller.dart';
import 'package:yuktidea_ui/app/modules/auth/sign_up/controllers/sign_up_controller.dart';

import '../controllers/landing_controller.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(
      () => LandingController(),
    );
  }
}
