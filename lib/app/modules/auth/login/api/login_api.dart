import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:yuktidea_ui/app/modules/auth/login/model/login_model.dart';
import 'package:yuktidea_ui/app/services/dio_client.dart';

class LoginAPI {
 


  Future<LoginModel?> loginServices(String? loginId, String? password) async {
    print('sdfsdfsdfsf');
    Dio dio = DioClient().dio;
   
    try {
      var formData = FormData.fromMap({
        "login": loginId,
        "password": password,
      });
      //   "login": "9876543210",
      // "password": "password",
      Response response = await dio.post(
        '/login',
        data: formData,
      );
      log(response.data.toString());

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        return LoginModel.fromJson(response.data);
      }
    } catch (e) {
  
      if (e is DioError) {
          log(e.response!.data.toString());
 
        if (e.response!.statusCode == 401) {
        
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
