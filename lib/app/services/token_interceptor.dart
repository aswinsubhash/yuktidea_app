import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yuktidea_ui/app/services/dio_client.dart';

class TokenInterceptor extends Interceptor {


  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      log(err.response?.statusCode.toString() ?? '');
      log(err.response?.data.toString() ?? '');
      final storage = FlutterSecureStorage();
      final token = await storage.read(key: 'token');
      // print(token);
      Dio dio = DioClient().dio;
      print('sdfdsf');

      print('gggggg');
      Response response = await dio.get('/refresh',
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          }));

      print(response.data);

      var tokenData = response.data['data'][0];
      var accessToken = tokenData['access_token'];
      storage.write(key: 'token', value: accessToken);
      RequestOptions options = err.response!.requestOptions;
      options.headers['Authorization'] = 'Bearer $accessToken';

      try {
        Response response = await dio.request(
          options.path,
          data: options.data,
          queryParameters: options.queryParameters,
          cancelToken: options.cancelToken,
          options: Options(
            method: options.method,
            headers: options.headers,
            responseType: options.responseType,
            contentType: options.contentType,
            validateStatus: options.validateStatus,
            receiveDataWhenStatusError: options.receiveDataWhenStatusError,
          ),
          onReceiveProgress: options.onReceiveProgress,
        );
        return response;
      } on DioError catch (e) {
        return e;
      }
    }
  }
}
