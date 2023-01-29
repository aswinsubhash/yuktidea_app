import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class APIServices {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://cinecompass.yuktidea.com/api/v1",
    ),
  );

  // String? accessToken;

  // final _storage = const FlutterSecureStorage();

  // APIServices() {
  //   dio.interceptors.add(
  //     InterceptorsWrapper(onRequest: (options, handler) async {
  //       // if(options.path.contains('http')){
  //       //   options.path = 'https://cinecompass.yuktidea.com/api/v1/refresh';
  //       // }
  //       options.headers['Authorization'] = 'Bearer $accessToken';
  //       return handler.next(options);
  //     }, onError: (DioError error, handler) async {
  //       if ((error.response?.statusCode == 401)) {
  //         if (await _storage.containsKey(key: 'token')) {
  //           await refreshToken();
  //           return handler.resolve(await _retry(error.requestOptions));
  //         }
  //       }
  //       return handler.next(error);
  //     }),
  //   );
  // }

  // Future<void> refreshToken() async {
  //   final refreshToken = await _storage.read(key: 'token');
  //   dio.options.headers['content-Type'] = 'application/json';
  //   dio.options.headers["authorization"] = "Bearer $refreshToken";
  //   final response = await dio.post('/refresh');

  //   if (response.statusCode == 200) {
  //     accessToken = response.data?[0].accessToken;
  //     log(accessToken.toString());
  //   } else {
  //     accessToken = null;
  //     _storage.deleteAll();
  //   }
  // }

  // Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
  //   final options = Options(
  //     method: requestOptions.method,
  //     headers: requestOptions.headers,
  //   );

  //   return dio.request<dynamic>(
  //     requestOptions.path,
  //     data: requestOptions.queryParameters,
  //     options: options,
  //   );
  // }
}
