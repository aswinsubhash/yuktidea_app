import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:yuktidea_ui/app/modules/auth/login/controllers/login_controller.dart';
import 'package:yuktidea_ui/app/modules/home/bindings/home_binding.dart';
import 'package:yuktidea_ui/app/modules/home/views/home_view.dart';
import 'package:yuktidea_ui/app/modules/landing/bindings/landing_binding.dart';
import 'package:yuktidea_ui/app/modules/landing/views/landing_view.dart';

class SplashController extends GetxController {
  final loginController  = Get.put(LoginController());
  @override
  void onInit() {
    checkUserLoggedIn();
    super.onInit();
  }


    Future<void> checkUserLoggedIn()async{
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: 'login_key');
    print(token);
    if(token != null){
      loginController.setIsLoggedIn(true);
    }else{
      loginController.setIsLoggedIn(false);
    }

    if(loginController.isLoggedIn.value){
      await Future.delayed(const Duration(seconds: 3));
      Get.off(()=>HomeView(),binding: HomeBinding());
    }else{
      await Future.delayed(const Duration(seconds: 3));
      Get.off(()=>LandingView(),binding: LandingBinding());
    }
  }
}
