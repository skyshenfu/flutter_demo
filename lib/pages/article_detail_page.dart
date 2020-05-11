import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailPage extends StatefulWidget{
  final String url;

  const ArticleDetailPage(this.url,{Key key}) : super(key: key);
  @override
  _ArticleDetailState createState() {
    // TODO: implement createState
    return _ArticleDetailState();
  }
}

class _ArticleDetailState extends State<ArticleDetailPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: WebView(
            initialUrl: widget.url
        )
      )
    );
  }
}