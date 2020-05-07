
import 'package:flutterallinone/data/model/pojos.dart';

class RawResponse{
  List<SingleBanner> data;
  int errorCode;
  String errorMsg;

  RawResponse({this.data, this.errorCode, this.errorMsg});

  RawResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
    var temp=json['data'];
    if (temp is List){
      data=new List();
      temp.forEach((v) {
        data.add(new SingleBanner.fromJson(v));
      });
    }else{
      print("456");

    }
    print("789");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    data['data']=this.data;
    return data;
  }
}