
import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  
  // @override
  // Future onRequest(
  //     RequestOptions options, RequestInterceptorHandler handler) async {
  //       print('sdfsdfsdfsdf');
  //   final excludePaths = <String>[
  //     '/login',
  //     '/register'
  //   ];
  //   if (!excludePaths.contains(options.path)) {
  //     final storage = FlutterSecureStorage();
  //   final token = await storage.read(key: 'token');
  //   options.headers['Authorization'] = 'Bearer $token'; 
  //   } 

   
  // }


  // @override
  // Future onError(DioError err, ErrorInterceptorHandler handler) async {
  //   print('errrrrrrrrrrr');
  //   if (err.response?.statusCode == 401) {
  //     log(err.response?.data);
  //     final storage = FlutterSecureStorage();
  //     final token = await storage.read(key: 'token');
  //     Dio dio = DioClient().dio;
  //     dio.options.headers['Accept'] = 'application/json';
  //     dio.options.headers['Authorization'] = 'Bearer $token';

  //     Response response = await dio.post('/refresh');

  //     var tokenData = response.data['data'][0];
  //     var accessToken = tokenData['access_token'];
  //     storage.write(key: 'token', value: accessToken);
  //     RequestOptions options = err.response!.requestOptions;
  //     options.headers['Authorization'] = 'Bearer $accessToken';

  //     try {
  //       Response response = await dio.request(
  //         options.path,
  //         data: options.data,
  //         queryParameters: options.queryParameters,
  //         cancelToken: options.cancelToken,
  //         options: Options(
  //           method: options.method,
  //           headers: options.headers,
  //           responseType: options.responseType,
  //           contentType: options.contentType,
  //           validateStatus: options.validateStatus,
  //           receiveDataWhenStatusError: options.receiveDataWhenStatusError,
  //         ),
  //         onReceiveProgress: options.onReceiveProgress,
  //       );
  //       return response;
  //     } on DioError catch (e) {
  //       return e;
  //     }
  //   }
  // }
}
