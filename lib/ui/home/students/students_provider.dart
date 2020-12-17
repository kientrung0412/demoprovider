import 'package:demo_provider/api/app_api.dart';
import 'package:demo_provider/api/response/user/data_response.dart';
import 'package:demo_provider/api/response/user/users_response.dart';
import 'package:demo_provider/base/base_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StudentsProvider extends BaseProvider {
  int page;

  List<DataResponse> data = [];
  List<DataResponse> dataOriginal = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  final textController = TextEditingController();
  final context;

  StudentsProvider.getListUsers({this.page = 1, this.context}) {
    getUser(page);
  }

  loadMore() async {
    page++;
    await getUser(page, isLoadMore: true);
  }

  reLoad() async {
    if (context != null) dismissKeyboard();
    page = 1;
    data = [];
    dataOriginal = [];
    textController.text = '';
    await getUser(page);
    refreshController.refreshCompleted(resetFooterState: true);
  }

  search(String keyWord) {
    data = [];
    if (keyWord.isEmpty || keyWord == null)
      data.addAll(dataOriginal);
    else {
      var reg = RegExp(keyWord);
      data.addAll(dataOriginal
          .where((element) => reg
              .hasMatch((element.firstName + element.lastName).toLowerCase()))
          .toList());
    }
    notifyListeners();
  }

  dismissKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
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

                if (successData.data.isNotEmpty) fillData(successData.data);
                notifyListeners();
              }
            }))
        .catchError(
            (error, stacktrace) => onError<UsersResponse>(error, stacktrace));
  }

  fillData(var rs) {
    dataOriginal.addAll(rs);
    data.addAll(rs);
  }
}
