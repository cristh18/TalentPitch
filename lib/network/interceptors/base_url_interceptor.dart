import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class BaseUrlInterceptor extends InterceptorsWrapper {
  BaseUrlInterceptor()
      : super(onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) {
          // options.baseUrl = baseUrl;
          handler.next(options);
        }, onResponse:
            (Response<dynamic> response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        }, onError: (DioException options, ErrorInterceptorHandler handler) {
          final Logger logger = Logger();
          logger.e(options.error);
          logger.e(options.response);
          logger.e(options.requestOptions);
          handler.next(options);
        });
}
