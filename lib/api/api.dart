import 'package:demo_provider/api/response/user/users_response.dart';
import 'package:demo_provider/cons/constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';


@RestApi(baseUrl: BASE_URL)
abstract class Api {
  factory Api(Dio dio) {
    return _Api(dio, baseUrl: BASE_URL);
  }

  @GET('users')
  Future<UsersResponse> getUser(@Query("page") int page);
}

