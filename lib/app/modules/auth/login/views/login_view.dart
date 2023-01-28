import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yuktidea_ui/app/common/widgets/common_button_widget.dart';
import 'package:yuktidea_ui/app/common/widgets/common_richtext_widget.dart';
import 'package:yuktidea_ui/app/common/widgets/common_sizedbox_widget.dart';
import 'package:yuktidea_ui/app/common/widgets/common_textfield_widget.dart';
import 'package:yuktidea_ui/app/modules/auth/login/views/widgets/password_textfield_widget.dart';
import 'package:yuktidea_ui/app/utils/app_colors.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: SafeArea(
          child: Obx(
        () => Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 80),
              child: Form(
                key: controller.formKeyLogin,
                child: Column(
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: AppColors.kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: 'Montserrat'
                      ),
                    ),
                    commonHeight(10),
                    Text(
                      'Please sign in to your account',
                      style: TextStyle(
                        color: AppColors.kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        fontFamily: 'Montserrat'
                      ),
                    ),
                    commonHeight(Get.height / 4.5),
                    SizedBox(
                      height: 75,
                      child: CustomTextFieldWidget(
                        hintText: 'Email/Phone number',
                        controller: controller.emailOrPasswordController,
                        validationMessage: 'Enter this field',
                        checkValidationMessage: 'Please enter valid email or password',
                      ),
                    ),
                    SizedBox(
                       height: 75,
                      child: PasswordTextField(
                        hintText: 'Password',
                        validationMessage: 'Please enter password',
                        controller: controller.passwordController,
                        isPasswordHidden: controller.isPasswordHidden.value,
                        onPressed: () {
                          controller.passwordHiding();
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                          text: 'Forgot Password?',
                          style: TextStyle(
                            color: AppColors.kGreyColor,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        )),
                      ],
                    ),
                    commonHeight(Get.height / 5),
                    SizedBox(
                      width: 200,
                      child: CustomButton(
                        text: 'Login',
                        onPressed: () {
                          controller.onLoginClick();
                        },
                        textColor: AppColors.kWhiteColor,
                        buttonColor: AppColors.kRedColor,
                        radius: 5,
                      ),
                    ),
                    commonHeight(10),
                    CustomRichTextWidget(
                      text: "Dont't have an account?",
                      clickText: ' Signup',
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
