import 'package:flutter/material.dart';
import 'package:flutterallinone/index_page.dart';
import 'package:flutterallinone/pages/bottomdemo/page/home_page_stack.dart';
import 'package:flutterallinone/pages/bottomdemo/page/home_page_index_stack.dart';
import 'package:flutterallinone/pages/bottomdemo/page/home_page_with_scroll.dart';
import 'package:flutterallinone/pages/splash/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MD测试',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: SplashPage(),
    );
  }
}
