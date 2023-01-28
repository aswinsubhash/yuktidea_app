import 'package:flutter/material.dart';

import 'package:yuktidea_ui/app/utils/app_colors.dart';
import 'package:yuktidea_ui/app/utils/app_string.dart';

class PasswordTextField extends StatelessWidget {
  final String hintText;
  final String validationMessage;
  final bool isPasswordHidden;
  final String? minPassText;
  final VoidCallback onPressed;

  final TextEditingController controller;
  PasswordTextField({
    Key? key,
    required this.hintText,
    required this.validationMessage,
    required this.isPasswordHidden,
    this.minPassText,
    required this.onPressed,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          cursorColor: AppColors.kRedColor,
          obscureText: isPasswordHidden,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validationMessage;
            }
            return null;
          },
          style: TextStyle(
            fontSize: 15,
            color: AppColors.kWhiteColor,
            fontWeight: FontWeight.bold,
            fontFamily: AppString.fontFamily,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: AppColors.kWhiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              fontFamily: AppString.fontFamily,
            ),
            fillColor: AppColors.kBlackColor,
            filled: true,
            hintText: hintText,
            suffixIcon: GestureDetector(
              child: Icon(
                isPasswordHidden
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: isPasswordHidden
                    ? AppColors.kGreyColor
                    : AppColors.kRedColor,
                size: 16,
              ),
              onTap: onPressed,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.kRedColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding: EdgeInsets.only(left: 10),
          ),
        ),
      ],
    );
  }
}
