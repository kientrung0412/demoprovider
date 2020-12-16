import 'package:demo_provider/api/app_api.dart';
import 'package:demo_provider/api/response/user/data_response.dart';
import 'package:demo_provider/api/response/user/users_response.dart';
import 'package:demo_provider/base/base_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeProvider extends BaseProvider {
  int page;

  List<DataResponse> dataResponse = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  HomeProvider.getListUsers({this.page = 1}) {
    getUser(page);
  }

  loadMore() async {
    page++;
    await getUser(page, isLoadMore: true);
  }

  reLoad() async {
    page = 1;
    dataResponse = [];
    await getUser(page);
    refreshController.refreshCompleted(resetFooterState: true);
  }

  Future<UsersResponse> getUser(int _page, {isLoadMore = false}) async {
    return AppApi.getApi()
        .getUser(_page)
        .then((value) => onComplete<UsersResponse>(value, (successData) {
              if (successData.data != null) {
                if (isLoadMore)
                  successData.data.isEmpty
                      ? refreshController.loadNoData()
                      : refreshController.loadComplete();

                if (successData.data.isNotEmpty)
                  dataResponse.addAll(successData.data);
                notifyListeners();
              }
            }))
        .catchError(
            (error, stacktrace) => onError<UsersResponse>(error, stacktrace));
  }
}
