import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:yuktidea_ui/app/modules/auth/sign_up/model/signup_model.dart';
import 'package:yuktidea_ui/app/services/dio_client.dart';

class SignupAPI {
  Future<SignupModel?> signupServices(
    String? name,
    String? email,
    String? phone,
    String? password,
    String? confirmPassword,
  ) async {
    Dio dio = DioClient().dio;
  //  dio.interceptors.add(TokenInterceptor()); 

    try {
      var formData = FormData.fromMap({
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": confirmPassword,
      });

      Response response = await dio.post(
        '/register',
        data: formData,
      );

      log(response.data.toString());

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        return SignupModel.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        log(e.response?.data.toString() ?? '');

        if (e.response!.statusCode == 400) {
          return SignupModel.fromJson(e.response!.data);
        }
        if (e.response!.data == null) {
          return SignupModel(message: 'Something went wrong');
        }
        return SignupModel(
          message: e.response!.data['message'],
        );
      }
    }
    return null;
  }
}
