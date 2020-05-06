import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterallinone/pages/bottomdemo/page/home_page_with_scroll.dart';
class SplashPage extends StatefulWidget{
  @override
  _SplashPageState createState() =>new _SplashPageState();

}
class _SplashPageState extends State<SplashPage>{
  aliveTime () async{
    var _duration=new Duration(seconds: 3);
    return new Timer(_duration,navigateToMainPage);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new SafeArea(
        child: Container(
          child: Center(
            child: Image.asset("assets/image/splash_bg.png"),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    aliveTime();
  }

  void navigateToMainPage() {
    Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context){
      return new HomePageScroll();
    }));
  }

}