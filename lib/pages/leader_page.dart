import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterallinone/data/config/api.dart';
import 'package:flutterallinone/data/config/response_raw.dart';
import 'package:flutterallinone/data/model/pojos.dart';
import 'package:flutterallinone/util/dio_util.dart';
import 'package:flutterallinone/widget/banner.dart';

class LeaderPageWidget extends StatefulWidget {
  @override
  _LeaderPageWidgetState createState() {
    // TODO: implement createState
    return _LeaderPageWidgetState();
  }

}

class _LeaderPageWidgetState extends State<LeaderPageWidget> with AutomaticKeepAliveClientMixin<LeaderPageWidget> {
  CancelToken cancelToken;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cancelToken=CancelToken();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: Column(
            children: <Widget>[

              FutureBuilder(
                builder: _futureBuilder,
                future: DioUtil.getInstance().getRequestFuture(Api.BANNER,(bannerResponse){
                  return BannerResponse.fromJson(bannerResponse);
                }),
              ),
              GestureDetector(
//                  onTap: _requestData,
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
//  void _requestData() {
//
//    DioUtil.getInstance().getRequest(Api.BANNER,cancelToken: cancelToken,successCallBack:_printV,errorCallBack: error1);
//  }

  error1(e){
  print("");
  }

//  void _printV(dynamic v) {
//    BannerResponse data =BannerResponse.fromJson(v);
//    setState(() {
//      this.banners=data.data;
//    });
//
//  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget _futureBuilder(BuildContext context, AsyncSnapshot snapshot) {
    switch(snapshot.connectionState){
      case ConnectionState.none:
        return Text("预备开始");

      case ConnectionState.waiting:
        return Text("加载中");
      case ConnectionState.active:
        return Text("激活");

      case ConnectionState.done:
        if(snapshot.hasError){
          return Text("加载错误");
        }else{
          return BannerWidget(
            banners: snapshot.data.data,
          );
        }
    }
  }

}
