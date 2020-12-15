import 'package:demo_provider/base/base_response.dart';

import 'data_response.dart';
import 'support_response.dart';

class UsersResponse with BaseResponse {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<DataResponse> data;
  SupportResponse support;

  UsersResponse(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.support});

  UsersResponse.fromJson(dynamic json) {
    page = json["page"];
    perPage = json["per_page"];
    total = json["total"];
    totalPages = json["total_pages"];
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data.add(DataResponse.fromJson(v));
      });
    }
    support = json["support"] != null
        ? SupportResponse.fromJson(json["support"])
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["page"] = page;
    map["per_page"] = perPage;
    map["total"] = total;
    map["total_pages"] = totalPages;
    if (data != null) {
      map["data"] = data.map((v) => v.toJson()).toList();
    }
    if (support != null) {
      map["support"] = support.toJson();
    }
    return map;
  }

  @override
  getErrorMessage() {
    throw "Có lỗi, xin vui lòng thử lại";
  }
}
