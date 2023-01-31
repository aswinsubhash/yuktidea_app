import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:yuktidea_ui/app/common/widgets/full_screen_loader.dart';
import 'package:yuktidea_ui/app/modules/auth/login/bindings/login_binding.dart';
import 'package:yuktidea_ui/app/modules/auth/login/views/login_view.dart';
import 'package:yuktidea_ui/app/modules/auth/otp_verification/bindings/otp_verification_binding.dart';
import 'package:yuktidea_ui/app/modules/auth/otp_verification/views/otp_verification_view.dart';
import 'package:yuktidea_ui/app/modules/auth/sign_up/api/signup_api.dart';
import 'package:yuktidea_ui/app/modules/auth/sign_up/model/signup_model.dart';
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

  String? token;

  void passwordHiding() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> onSignupClick() async {
    if (formKeySignup.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        AppSnackbars.showErrorSnackBar(
          message: 'Password do not match',
        );
      } else {
        FullScreenDialogLoader.showLoading();
        SignupModel? response = await SignupAPI().signupServices(
          nameController.text,
          emailController.text,
          phoneNumberController.text,
          passwordController.text,
          confirmPasswordController.text,
        );
        FullScreenDialogLoader.hideLoading(); 
        if (response != null) {
          if (response.status == true) {
            AppSnackbars.showSuccessSnackBar(
              message: 'Otp send successfully',
            );

            Get.to(
              () => OtpVerificationView(),
              binding: OtpVerificationBinding(),
              transition: Transition.rightToLeft,
              duration: Duration(
                milliseconds: 400,
              ),
            );
            token = response.data?[0].accessToken;
          } else {
            AppSnackbars.showErrorSnackBar(
              message: 'Email or Password already existing',
            );
          }
        }
        tokenSaving();
      }
    }
  }

  void onLoginClick() {
    Get.off(() => LoginView(),
        binding: LoginBinding(),
        transition: Transition.leftToRight,
        duration: Duration(
          milliseconds: 400,
        ));
  }

  Future<void> tokenSaving() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: token);

    print(await storage.read(key: 'token'));
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
