import 'package:demo_provider/api/app_api.dart';
import 'package:demo_provider/api/response/user/data_response.dart';
import 'package:demo_provider/api/response/user/users_response.dart';
import 'package:demo_provider/base/base_provider.dart';

class HomeProvider extends BaseProvider {
  List<DataResponse> dataResponse = [];

  HomeProvider.getListUsers(int page) {
    getUser(page);
  }

  Future<UsersResponse> getUser(int page) async {
    return AppApi.getApi()
        .getUser(page)
        .then((value) => onComplete<UsersResponse>(value, (successData) {
              if (successData.data != null) {
                dataResponse.addAll(successData.data);
                notifyListeners();
              }
            }))
        .catchError(
            (error, stacktrace) => onError<UsersResponse>(error, stacktrace));
  }
}
