
import 'package:dio/dio.dart';

class DioClient {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://cinecompass.yuktidea.com/api/v1",
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.json,
    ),
  );


  // DioClient(){
  // this.dio = Dio();
  // this.dio.interceptors.add(InterceptorsWrapper(

  // ));
  // }
//  final  Dio dio = Dio(
//     BaseOptions(
//       baseUrl: "https://cinecompass.yuktidea.com/api/v1",
//       connectTimeout: 5000,
//       receiveTimeout: 3000,
//       responseType: ResponseType.json,
//     ),
//   );

}
