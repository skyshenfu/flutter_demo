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
