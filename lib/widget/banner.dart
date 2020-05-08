import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterallinone/data/model/pojos.dart';

import 'indicator_painter.dart';

class BannerWidget extends StatelessWidget {
  final List<SingleBanner> banners;
  final _pageController = PageController();
  int _currentPage=0;

  BannerWidget({Key key, this.banners}) : super(key: key);

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
    banners.forEach((banner) {
      widgets.add(_getPage(banner));
    });
    return widgets;
  }

  Widget _getPage(SingleBanner banner) {
    return Image.network(
      banner.imagePath,
      fit: BoxFit.fitWidth,
    );
  }

  Widget _pageViewHolder() {
    if (banners.isEmpty) {
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

  final Timer timer = new Timer.periodic(new Duration(seconds: 2),(timer){

  });

  List<Widget> _getIndicator(int index) {
    List<Widget> result = [];
    int count = banners.length;
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
    this._currentPage=value;
  }
}
