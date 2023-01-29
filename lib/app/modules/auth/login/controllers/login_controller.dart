import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:yuktidea_ui/app/modules/auth/login/api/login_api.dart';
import 'package:yuktidea_ui/app/modules/auth/login/model/login_model.dart';
import 'package:yuktidea_ui/app/modules/auth/sign_up/bindings/sign_up_binding.dart';
import 'package:yuktidea_ui/app/modules/auth/sign_up/views/sign_up_view.dart';
import 'package:yuktidea_ui/app/modules/home/views/home_view.dart';
import 'package:yuktidea_ui/app/services/api_services.dart';
import 'package:yuktidea_ui/app/utils/app_snackbar_widget.dart';

class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailOrPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  String? token;

  @override
  void onClose() {
    passwordController.dispose();
    emailOrPasswordController.dispose();
    super.onClose();
  }

  void passwordHiding() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  /// Function to handle the login process.
  /// Validates the form fields and makes a call to the LoginAPI to perform the actual login.
  /// Displays a welcome snackbar if the login was successful, or an error snackbar if the login was unsuccessful.
  Future<void> onLoginClick() async {
    if (formKeyLogin.currentState!.validate()) {
      LoginModel? response =
          await LoginAPI(apiServices: APIServices()).loginServices(
        emailOrPasswordController.text,
        passwordController.text,
      );
      if (response != null) {
        if (response.status == true) {
          AppSnackbars.welcomeSnackBar(
            message: response.message!,
            title: 'Hola! Welcome Back to CINE COMPASS',
          );
          Get.offAll(() => HomeView());
        } else {
          AppSnackbars.showErrorSnackBar(
            message: response.message!,
          );
        }
        token = response.data?[0].accessToken;
      }
      tokenSaving();
    }
  }

  /// Function to handle navigation to the SignUpView.
  void onSignupClick() {
    Get.off(
      () => SignUpView(),
      binding: SignUpBinding(),
      transition: Transition.rightToLeft,
      duration: Duration(
        milliseconds: 400,
      ),
    );
  }

  Future<void> tokenSaving() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: token);

    print(await storage.read(key: 'token'));
  }
}
