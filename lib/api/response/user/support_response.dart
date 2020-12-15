class SupportResponse {
  String url;
  String text;

  SupportResponse({
      this.url, 
      this.text});

  SupportResponse.fromJson(dynamic json) {
    url = json["url"];
    text = json["text"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["url"] = url;
    map["text"] = text;
    return map;
  }

}