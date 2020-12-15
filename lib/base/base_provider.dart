import 'package:flutter/cupertino.dart';

import 'base_response.dart';

class BaseProvider extends ChangeNotifier {
  Future<T> onComplete<T extends BaseResponse>(
      T value, Function(T successData) onSuccess) {
    onSuccess(value);
    return Future.value(value);
  }

  Future<T> onError<T extends BaseResponse>(
      dynamic error, StackTrace stacktrace) {
    if (stacktrace == null || stacktrace.toString().isEmpty) {
      return Future<T>.error(error, stacktrace);
    }
  }
}
