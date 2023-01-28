import 'package:get/get.dart';
import 'package:yuktidea_ui/app/modules/auth/login/bindings/login_binding.dart';
import 'package:yuktidea_ui/app/modules/auth/login/controllers/login_controller.dart';
import 'package:yuktidea_ui/app/modules/auth/login/views/login_view.dart';

class LandingController extends GetxController {
  void getStartedClick() {
    Get.off(
      () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.rightToLeftWithFade,
      duration: Duration(
        milliseconds: 400,
      ),
    );
  }
}
