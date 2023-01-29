import 'package:get/get.dart';
import 'package:yuktidea_ui/app/modules/landing/bindings/landing_binding.dart';
import 'package:yuktidea_ui/app/modules/landing/views/landing_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkUserLoggedIn();
    super.onInit();
  }

  checkUserLoggedIn() async {
    await Future.delayed(Duration(seconds: 3));
    Get.off(
      () => LandingView(),
      transition: Transition.fadeIn,
      binding: LandingBinding()
    );
  }
}
