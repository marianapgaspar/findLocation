import 'package:dio/dio.dart';

class HttpClient {
  late Dio _dio;

  HttpClient() {
    _dio = Dio();
    _setupInterceptors();
  }

  Dio getDio(){
    return _dio;
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          return handler.next(e);
        },
      ),
    );
  }
}

