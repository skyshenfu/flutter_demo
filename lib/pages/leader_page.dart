import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterallinone/repository/repository.dart';
import 'package:flutterallinone/widget/article_holder_widget.dart';
import 'package:flutterallinone/widget/banner.dart';

class LeaderPageWidget extends StatefulWidget {
  @override
  _LeaderPageWidgetState createState() {
    // TODO: implement createState
    return _LeaderPageWidgetState();
  }
}

class _LeaderPageWidgetState extends State<LeaderPageWidget>
    with AutomaticKeepAliveClientMixin<LeaderPageWidget> {
  CancelToken cancelToken;
  Future _future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cancelToken = CancelToken();
    _future = APIRepository.getInstance().getBannersFuture(cancelToken:cancelToken);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        backgroundColor: Color.fromARGB(1, 246, 245, 250),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              FutureBuilder(builder: _futureBuilder, future: _future),
              Expanded(flex: 1, child: ArticleHolderWidget())
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


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  Widget _futureBuilder(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
        return Text("加载中");
      case ConnectionState.done:
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return BannerWidget(
            banners: snapshot.data,
          );
        }
        break;
      default:
        return Container(width: 0.0, height: 0.0);
    }
  }
}
