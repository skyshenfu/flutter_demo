import 'package:flutter/material.dart';
import 'package:flutterallinone/pages/bottomdemo/page/home_page_index_stack.dart';
import 'package:flutterallinone/pages/bottomdemo/page/home_page_stack.dart';
import 'package:flutterallinone/pages/bottomdemo/page/home_page_with_scroll.dart';

class BottomIndexPage extends StatelessWidget{
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
                return new HomePage();
              }));
            }, child: Text("Stack保持状态处理"),),
            new RaisedButton(onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context){
                return new HomePageIndexStack();
              }));
            }, child: Text("IndexedStack保持状态处理"),),
            new RaisedButton(onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context){
                return new HomePageScroll();
              }));
            }, child: Text("可滚动+保持状态"),)
          ],
        ),
      ),
     backgroundColor: Colors.green,
    );
  }
  
}