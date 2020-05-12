import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommonWebViewPage extends StatefulWidget{
  final String url;

  const CommonWebViewPage(this.url,{Key key}) : super(key: key);
  @override
  _CommonWebViewPageState createState() {
    // TODO: implement createState
    return _CommonWebViewPageState();
  }
}

class _CommonWebViewPageState extends State<CommonWebViewPage>{

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