import 'package:get/get.dart';
import 'package:yuktidea_ui/app/modules/auth/landing/bindings/landing_binding.dart';
import 'package:yuktidea_ui/app/modules/auth/login/bindings/login_binding.dart';
import 'package:yuktidea_ui/app/modules/auth/login/views/login_view.dart';
import 'package:yuktidea_ui/app/modules/auth/otp_verification/bindings/otp_verification_binding.dart';
import 'package:yuktidea_ui/app/modules/auth/otp_verification/views/otp_verification_view.dart';
import 'package:yuktidea_ui/app/modules/auth/sign_up/bindings/sign_up_binding.dart';
import 'package:yuktidea_ui/app/modules/auth/sign_up/views/sign_up_view.dart';
import 'package:yuktidea_ui/app/modules/home/bindings/home_binding.dart';
import 'package:yuktidea_ui/app/modules/home/views/home_view.dart';

import '../modules/auth/landing/views/landing_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LANDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => LandingView(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION,
      page: () => OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
  ];
}