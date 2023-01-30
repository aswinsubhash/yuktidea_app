import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:yuktidea_ui/app/modules/auth/login/bindings/login_binding.dart';
import 'package:yuktidea_ui/app/modules/auth/login/controllers/login_controller.dart';
import 'package:yuktidea_ui/app/modules/auth/login/views/login_view.dart';

class HomeController extends GetxController {
  final loginController = Get.put(LoginController());
  Future<void> logout() async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
    await storage.delete(key: 'userId');
    loginController.setIsLoggedIn(false);
    Get.offAll(() => LoginView(), binding: LoginBinding());
  }
}
