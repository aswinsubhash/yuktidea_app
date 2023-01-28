import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yuktidea_ui/app/modules/auth/sign_up/views/sign_up_view.dart';

class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailOrPasswordController  = TextEditingController();
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  void passwordHiding() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void onLoginClick() {
    if (formKeyLogin.currentState!.validate()) {
     
    }
  }

  void onSignupClick(){
    Get.to(()=>SignUpView());
  }

}
