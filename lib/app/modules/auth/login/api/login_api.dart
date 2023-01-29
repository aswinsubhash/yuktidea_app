import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:yuktidea_ui/app/modules/auth/login/model/login_model.dart';
import 'package:yuktidea_ui/app/services/api_services.dart';

class LoginAPI {
  final APIServices apiServices;

  LoginAPI({
    required this.apiServices,
  });

  Future<LoginModel?> loginServices(String? loginId, String? password) async {
    print('sdfsdfsdfsf');
    try {
      var formData = FormData.fromMap({
        "login": loginId,
        "password": password,
      });
      //   "login": "9876543210",
      // "password": "password",
      Response response = await apiServices.dio.post(
        '/login',
        data: formData,
      );
      log(response.data.toString());

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        return LoginModel.fromJson(response.data);
      }
      log(response.data);
    } catch (e) {
      if (e is DioError) {
        if (e.response!.statusCode == 401) {
          log(e.response!.data.toString());

          return LoginModel.fromJson(e.response!.data);
        }
        if (e.response?.data == null) {
          return LoginModel(message: 'Something went wrong');
        }
        return LoginModel(
          message: e.response!.data['message'],
        );
      }
    }
    return null;
  }
}
