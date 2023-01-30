import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:yuktidea_ui/app/modules/auth/otp_verification/model/otp_verify_model.dart';
import 'package:yuktidea_ui/app/services/dio_client.dart';

class OtpVerificationAPI {
  Future<OtpVerificationModel?> verifyOtpService(String? otp) async {
    Dio dio = DioClient().dio;

    try {
      var formData = FormData.fromMap({
        "otp": otp,
      });

      Response response = await dio.post(
        '/otp/verify',
        data: formData,
      );

      log(response.data.toString());

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        return OtpVerificationModel.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        log(e.response!.data.toString());
        if (e.response!.statusCode == 400) {
          return OtpVerificationModel.fromJson(e.response!.data);
        }

        if (e.response?.data == null) {
          return OtpVerificationModel(message: 'Something went wrong');
        }
        return OtpVerificationModel(
          message: e.response!.data['message'],
        );
      }
    }
    return null;
  }
}
