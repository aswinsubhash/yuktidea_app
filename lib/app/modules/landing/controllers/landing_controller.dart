import 'package:get/get.dart';
import 'package:yuktidea_ui/app/modules/auth/login/views/login_view.dart';

class LandingController extends GetxController {
  void getStartedClick() {
    Get.to(
      () =>LoginView(),
      transition: Transition.rightToLeftWithFade,
      duration: Duration(
        milliseconds: 400,
      ),
    );

    // Get.toNamed("/login");
  }
}
