import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterallinone/data/model/pojos.dart';
import 'package:flutterallinone/util/dio_util.dart';
import 'package:flutterallinone/widget/over_scroll.dart';

import 'webview_page.dart';

class ArticlePageWidget extends StatefulWidget {
  @override
  _ArticlePageWidgetState createState() {
    // TODO: implement createState
    return _ArticlePageWidgetState();
  }
}

class _ArticlePageWidgetState extends State<ArticlePageWidget>
    with AutomaticKeepAliveClientMixin<ArticlePageWidget> {
  CancelToken cancelToken;
  List<SingleArticle> _articles;
  ScrollController _scrollController;
  CommonPageData _pageData;

  int _load_more_status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cancelToken = CancelToken();
    _articles = [];
    _load_more_status = 1;
    _refresh();
    _scrollController = new ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          print('滑动到了最底部');
          _loadMore(_pageData.curPage + 1);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        backgroundColor: Color.fromARGB(1, 246, 245, 250),
        body: SafeArea(
            child:
                RefreshIndicator(onRefresh: _refresh, child: _generateList())));
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

  Widget _generateList() {
    return ScrollConfiguration(
        behavior: OverScrollBehavior(),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: this._articles.length,
                  itemBuilder: (context, item) {
                    return new Column(
                      children: <Widget>[
                        _buildListData(context, this._articles[item]),
                      ],
                    );
                  }),
            ),
            _showBottom()
          ],
        ));
  }

  Future<void> _refresh() async {
    return DioUtil.getInstance().simpleRequest("/article/list/0/json",
        successCallBack: (result) {
      List<SingleArticle> articles = [];
      result['datas'].forEach((v) {
        articles.add(SingleArticle.fromJson(v));
      });

      setState(() {
        this._articles = articles;
        this._pageData = CommonPageData.fromJson(result);
      });
    });
  }

  Widget _buildListData(BuildContext context, SingleArticle itemData) {
    return GestureDetector(
        onTap: () {
          _tapArticle(itemData);
        },
        child: Container(
            height: 80,
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(2))),
            child: Align(
                alignment: FractionalOffset(0.0, 0.5),
                child: Text(itemData.title, textAlign: TextAlign.left))));
  }

  Future<void> _loadMore(int page) async {
    if (page > _pageData.pageCount) {
      setState(() {
        _load_more_status = 3;
      });
      return;
    }
    if (_load_more_status == 2) {
      return;
    }
    setState(() {
      _load_more_status = 2;
    });
    DioUtil.getInstance().simpleRequest("/article/list/$page/json",
        successCallBack: (result) {
      List<SingleArticle> articles = [];
      result['datas'].forEach((v) {
        articles.add(SingleArticle.fromJson(v));
      });
      setState(() {
        this._articles = this._articles..addAll(articles);
        _load_more_status = 1;
      });
    });
  }

  Widget _showBottom() {
    if (_load_more_status == 2) {
      return Center(
        child: Text("加载中"),
      );
    } else if (_load_more_status == 3) {
      return Center(
        child: Text("没有更多"),
      );
    } else {
      return Center(
        child: Text("目前" + this._articles.length.toString() + "条"),
      );
    }
  }

  void _tapArticle(SingleArticle itemData) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return CommonWebViewPage(itemData.link);
    }));
  }
}
