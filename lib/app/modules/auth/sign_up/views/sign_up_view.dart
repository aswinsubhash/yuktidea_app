import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yuktidea_ui/app/common/widgets/common_button_widget.dart';
import 'package:yuktidea_ui/app/common/widgets/common_richtext_widget.dart';
import 'package:yuktidea_ui/app/common/widgets/common_sizedbox_widget.dart';
import 'package:yuktidea_ui/app/common/widgets/common_textfield_widget.dart';
import 'package:yuktidea_ui/app/common/widgets/password_textfield_widget.dart';
import 'package:yuktidea_ui/app/utils/app_colors.dart';
import 'package:yuktidea_ui/app/utils/app_string.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: SafeArea(
          child: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 35),
            child: Form(
              key: controller.formKeySignup,
              child: Column(
                children: [
                  Text(
                    AppString.signupScreenTitle,
                    style: TextStyle(
                      color: AppColors.kWhiteColor,
                      fontFamily: AppString.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  commonHeight(10),
                  Text(
                    AppString.signupScreenSubtitle,
                    style: TextStyle(
                      color: AppColors.kWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      fontFamily: AppString.fontFamily,
                    ),
                  ),
                  commonHeight(Get.height / 12),
                  SizedBox(
                    height: 75,
                    child: CustomTextFieldWidget(
                      hintText: 'Name',
                      controller: controller.nameController,
                      validationMessage: 'Please enter name',
                    ),
                  ),
                  SizedBox(
                    height: 75,
                    child: CustomTextFieldWidget(
                      hintText: 'Email',
                      controller: controller.emailController,
                      validationMessage: 'Please enter email',
                      checkValidationMessage: 'Enter a valid email',
                    ),
                  ),
                  SizedBox(
                    height: 75,
                    child: CustomTextFieldWidget(
                      hintText: 'Phone Number',
                      controller: controller.phoneNumberController,
                      validationMessage: 'Please enter phone number',
                      checkValidationMessage: 'Enter a valid phone number',
                    ),
                  ),
                  SizedBox(
                    height: 75,
                    child: PasswordTextField(
                      hintText: 'Password',
                      validationMessage: 'Please enter password',
                      isPasswordHidden: controller.isPasswordHidden.value,
                      controller: controller.passwordController,
                      onPressed: () {
                        controller.passwordHiding();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 75,
                    child: PasswordTextField(
                      hintText: 'Confirm Password',
                      validationMessage: 'Please enter password',
                      isPasswordHidden: controller.isPasswordHidden.value,
                      controller: controller.confirmPasswordController,
                      onPressed: () {
                        controller.passwordHiding();
                      },
                    ),
                  ),
                  commonHeight(Get.height / 12),
                  SizedBox(
                    width: 200,
                    child: CustomButton(
                      text: AppString.signupButton,
                      onPressed: () {
                        controller.onSignupClick();
                      },
                      textColor: AppColors.kWhiteColor,
                      buttonColor: AppColors.kRedColor,
                      radius: 5,
                    ),
                  ),
                  commonHeight(10),
                  CustomRichTextWidget(
                    text: 'Already have and account?',
                    clickText: ' Login',
                    onPressed: () {
                      controller.onLoginClick();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
