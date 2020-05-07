import 'package:flutterallinone/data/model/pojos.dart';

class RawResponse {
  int errorCode;
  String errorMsg;

  RawResponse({this.errorCode, this.errorMsg});

  RawResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}

class BannerResponse extends RawResponse {
  List<SingleBanner> data;

  BannerResponse(this.data);
  BannerResponse.fromJson(Map<String, dynamic> json) {
    var temp = json['data'];
    if (temp is List) {
      data = new List();
      temp.forEach((v) {
        data.add(new SingleBanner.fromJson(v));
      });
    }
  }
}
