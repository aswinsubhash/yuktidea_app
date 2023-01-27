import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OtpVerificationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OtpVerificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
