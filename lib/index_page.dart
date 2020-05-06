import 'package:flutter/material.dart';
import 'package:flutterallinone/pages/bottomdemo/bottom_index_page.dart';
import 'package:flutterallinone/pages/tabbardemo/top_tabbar_demo.dart';
import 'package:flutterallinone/pages/tabbardemo/top_tabbar_stateless_demo.dart';
import 'package:flutterallinone/pages/tabbardemo/top_tabbar_stateless_demo.dart';


 ///总索引页面，根据不同按钮跳转到不同的索引Page
class IndexPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context){
                return new BottomIndexPage();
              }));
            }, child: Text("底部导航"),),
            new RaisedButton(onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context){
                return new TopTabBarLessDemo();
              }));
            }, child: Text("tab"),)
          ],
        ),
      )
    );
  }
  
}