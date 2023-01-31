import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:yuktidea_ui/app/modules/auth/login/bindings/login_binding.dart';
import 'package:yuktidea_ui/app/modules/auth/login/controllers/login_controller.dart';
import 'package:yuktidea_ui/app/modules/auth/login/views/login_view.dart';

class HomeController extends GetxController {
  final loginController = Get.put(LoginController());

  final storage = FlutterSecureStorage();


  void logout()  {
    Get.defaultDialog(
      title: 'Exit',
      content: Text('Are you sure, you want to exit?'),
      textConfirm: 'Yes',
      textCancel: 'No',
      onConfirm: () async {
        await storage.delete(key: 'token');
        await storage.delete(key: 'login_key');
        loginController.setIsLoggedIn(false);
        Get.offAll(() => LoginView(), binding: LoginBinding());
      },
    );
  }
}
