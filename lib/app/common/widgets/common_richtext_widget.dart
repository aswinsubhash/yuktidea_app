import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yuktidea_ui/app/utils/app_colors.dart';
import 'package:yuktidea_ui/app/utils/app_string.dart';

class CustomRichTextWidget extends StatelessWidget {
  final String text;
  final String clickText;
  final VoidCallback onPressed;
  const CustomRichTextWidget({
    Key? key,
    required this.text,
    required this.clickText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: AppColors.kGreyColor,
          fontSize: 12,
          fontFamily: AppString.fontFamily,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
            text: clickText,
            style: TextStyle(
              color: AppColors.kRedColor,
              fontSize: 12,
            ),
            recognizer: TapGestureRecognizer()..onTap = onPressed,
          ),
        ],
      ),
    );
  }
}
