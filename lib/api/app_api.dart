import 'dart:developer';

import 'package:demo_provider/cons/constant.dart';
import 'package:dio/dio.dart';

import 'api.dart';

class AppApi {
  static final Dio dio = Dio()
    ..options = BaseOptions(
        baseUrl: Constant.BASE_URL, connectTimeout: 30000, receiveTimeout: 6000)
    ..interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      request: true,
      requestHeader: true,
      error: true,
      logPrint: (object) {
        log(object);
      },
    ));

  static Api _api;

  static Api getApi() {
    _api ??= Api(dio);
    return _api;
  }
}
