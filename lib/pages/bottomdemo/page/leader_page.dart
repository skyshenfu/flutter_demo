import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterallinone/data/config/api.dart';
import 'package:flutterallinone/data/config/response_raw.dart';
import 'package:flutterallinone/data/model/pojos.dart';
import 'package:flutterallinone/util/dio_util.dart';

class LeaderPageWidget extends StatefulWidget {
  @override
  _LeaderPageWidgetState createState() {
    // TODO: implement createState
    return _LeaderPageWidgetState();
  }

}

class _LeaderPageWidgetState extends State<LeaderPageWidget> {
  CancelToken cancelToken;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cancelToken=CancelToken();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              GestureDetector(
                  onTap: _requestData,
                  child: Text(
                "123",
                style: TextStyle(fontSize: 30),
              ))
            ],
          ),
        ));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    cancelToken.cancel();
    super.dispose();
    
  }
  void _requestData() {
    
    DioUtil.getInstance().getRequest(Api.BANNER,cancelToken: cancelToken,successCallBack:_printV,errorCallBack: error1);
  }

  error1(e){
  print("");
  }

  void _printV(dynamic v) {
    BannerResponse data =BannerResponse.fromJson(v);
    print("");

  }
}
