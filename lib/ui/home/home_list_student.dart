import 'package:demo_provider/api/response/user/data_response.dart';
import 'package:demo_provider/ui/home/home_provider.dart';
import 'package:demo_provider/ui/home/view_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeListStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return SmartRefresher(
      controller: provider.refreshController,
      enablePullUp: true,
      physics: BouncingScrollPhysics(),
      footer: ClassicFooter(
        idleText: "Tải xong",
        loadingText: "Đang tải...",
        canLoadingText: "Tải thêm",
        noDataText: "Đây là trang cuối",
        loadStyle: LoadStyle.ShowWhenLoading,
        completeDuration: Duration(milliseconds: 500),
      ),
      child: ListView.builder(
        itemCount: provider.dataResponse.length,
        itemBuilder: (context, index) {
          return ItemUser(provider.dataResponse[index], index);
        },
      ),
      onRefresh: provider.reLoad,
      onLoading: provider.loadMore,
    );
  }
}
