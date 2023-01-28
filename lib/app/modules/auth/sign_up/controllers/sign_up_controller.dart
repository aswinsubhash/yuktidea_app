import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuktidea_ui/app/modules/auth/login/bindings/login_binding.dart';
import 'package:yuktidea_ui/app/modules/auth/login/views/login_view.dart';
import 'package:yuktidea_ui/app/utils/app_snackbar_widget.dart';

class SignUpController extends GetxController {
  var isPasswordHidden = true.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKeySignup = GlobalKey<FormState>();

  void passwordHiding() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void onSignupClick() {
    if (formKeySignup.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        AppSnackbars.showErrorSnackBar(
          message: 'Password do not match',
        );
      }
    }
  }

  void onLoginClick() {
    Get.off(() => LoginView(),
        binding: LoginBinding(),
        transition: Transition.rightToLeftWithFade,
        duration: Duration(
          milliseconds: 400,
        ));
  }
}
