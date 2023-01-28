import 'package:flutter/material.dart';
import 'package:yuktidea_ui/app/utils/app_colors.dart';
import 'package:yuktidea_ui/app/utils/app_string.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? validationMessage;
  final String? checkValidationMessage;

  CustomTextFieldWidget(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.validationMessage,
      this.checkValidationMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        } else {
          if (checkValidationMessage != null) {
            if (RegExp(r'.+@.+\.com$').hasMatch(value)) {
              return null;
            } else if (RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value)) {
              return null;
            }
            return checkValidationMessage;
          }
        }
        return null;
      },
      controller: controller,
      cursorColor: AppColors.kRedColor,
      style: TextStyle(
        fontSize: 15,
        color: AppColors.kWhiteColor,
        fontWeight: FontWeight.bold,
        fontFamily: AppString.fontFamily,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.kWhiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
          fontFamily: AppString.fontFamily,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kRedColor,
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        contentPadding: EdgeInsets.all(8.0),
        fillColor: AppColors.kBlackColor,
        filled: true,
      ),
    );
  }
}
