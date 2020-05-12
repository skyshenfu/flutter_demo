import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterallinone/data/model/pojos.dart';
import 'package:flutterallinone/pages/webview_page.dart';

import 'indicator_painter.dart';

class BannerWidget extends StatefulWidget {
  final banners;

  BannerWidget({Key key, this.banners}) : super(key: key);




  @override
  _BannerWidgetState createState() {
    // TODO: implement createState
    return new _BannerWidgetState();
  }
}
class _BannerWidgetState extends State<BannerWidget>{
  PageController _pageController;
  int _currentPage;
  Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentPage=0;
    _pageController = PageController();
    timer=new Timer.periodic(new Duration(seconds: 5),(timer){
        if(widget.banners.length>0){
          int jumpTarget= (_currentPage >=widget.banners.length-1 ? 0:_currentPage+1);
          _pageController.jumpToPage(jumpTarget);
        }

    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 160,
      width: double.infinity,
      padding: EdgeInsets.all(0),
      child: Center(
        child: _pageViewHolder(),
      ),
    );
  }

  List<Widget> _getPages() {
    List<Widget> widgets = [];
    widget.banners.forEach((banner) {
      widgets.add(_getPage(banner));
    });
    return widgets;
  }

  Widget _getPage(SingleBanner banner) {
    return GestureDetector(
      onTap: (){
        _tapBanner(banner);
      },
      child: Image.network(
        banner.imagePath,
        fit: BoxFit.fitWidth,
      )
    );
  }

  Widget _pageViewHolder() {
    if (widget.banners.isEmpty) {
      return Image.network(
        "https://pics7.baidu.com/feed/7aec54e736d12f2ea0a8a098c20f7464873568e8.jpeg?token=b7b46aab7eb9b86e8ed065d79de7b85c",
        fit: BoxFit.fill,
      );
    } else {
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          PageView(controller: _pageController, children: _getPages(),onPageChanged: _pageChangeMethod),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _getIndicator(_currentPage),
          )
        ],
      );
    }

  }
  List<Widget> _getIndicator(int index) {
    List<Widget> result = [];
    int count = widget.banners.length;
    for (int i = 0; i < count; i++) {
      result.add(Container(
          margin: EdgeInsets.only(left: 15,bottom: 10),
          child: CustomPaint(
              painter: Indicator(i==index ? Colors.deepPurpleAccent:Colors.white),
              size: Size(5, 5))));
    }
    return result;
  }

  void _pageChangeMethod(int value) {
    setState(() {
      this._currentPage=value;
    });

  }
  @override
  void dispose() {
    timer.cancel();
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  void _tapBanner(SingleBanner banner) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return CommonWebViewPage(banner.url);
    }));
  }
}

