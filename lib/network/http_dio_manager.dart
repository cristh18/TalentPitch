import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpDioManager {
  HttpDioManager({
    List<InterceptorsWrapper>? interceptors,
  }) : dio = Dio(
          BaseOptions(
            baseUrl: 'https://data2.talentpitch.co',
            contentType: 'application/json; charset=UTF-8',
            connectTimeout: const Duration(seconds: 10),
            sendTimeout: const Duration(seconds: 10),
          ),
        ) {
    interceptors?.forEach((InterceptorsWrapper interceptor) {
      dio.interceptors.add(interceptor);
    });

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ));
    }
  }

  final Dio dio;

  void close() {
    dio.close();
  }
}
