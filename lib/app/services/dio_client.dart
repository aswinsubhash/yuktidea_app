import 'package:dio/dio.dart';
import 'package:yuktidea_ui/app/services/token_interceptor.dart';

class DioClient {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://cinecompass.yuktidea.com/api/v1",
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.json,
    ),
  );

}
