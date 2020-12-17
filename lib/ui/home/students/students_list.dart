import 'package:demo_provider/ui/home/students/students_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../view_student.dart';

class HomeListStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentsProvider>(context);
    return SmartRefresher(
      controller: provider.refreshController,
      enablePullUp: true,
      physics: const BouncingScrollPhysics(),
      footer: const ClassicFooter(
        idleText: "Tải xong",
        loadingText: "Đang tải...",
        canLoadingText: "Tải thêm",
        noDataText: "Đây là trang cuối",
        loadStyle: LoadStyle.ShowWhenLoading,
        completeDuration: const Duration(milliseconds: 500),
      ),
      child: ListView.builder(
        itemCount: provider.data.length,
        itemBuilder: (context, index) {
          return ItemUser(provider.data[index], index);
        },
      ),
      onRefresh: provider.reLoad,
      onLoading: provider.loadMore,
    );
  }
}
