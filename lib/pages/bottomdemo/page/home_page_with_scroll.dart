import 'package:flutter/material.dart';
import 'package:flutterallinone/pages/bottomdemo/simpleTab/tab_stateful_page.dart';
///方案三 PageView实现，可滚动需要对Tab进行mixin
class HomePageScroll extends StatefulWidget {
  HomePageScroll({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _HomePageScrollState createState() => _HomePageScrollState();
}

class _HomePageScrollState extends State<HomePageScroll> {
  final  titleStr="PageView实现，可滚动";
  final  photoStr="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554821553942&di=6be93e131cedb5036c92c065cc873d2d&imgtype=0&src=http%3A%2F%2Fpic.51yuansu.com%2Fpic3%2Fcover%2F00%2F61%2F50%2F586e242f0a3d8_610.jpg";
  int _tabIndex;
  var _pageController;
  final pages=<Widget>[
    new Tab1Page(key:Key("1"),centerText: "1",color: Colors.red),
    new Tab1Page(key:Key("2"),centerText: "2",color: Colors.amber),
    new Tab1Page(key:Key("3"),centerText: "3",color: Colors.deepPurpleAccent)
  ];
  void _pressLeft(){
    print("点击第一按钮");
  }

  @override
  void initState() {
    super.initState();
    this._tabIndex=0;
    this._pageController=new PageController(initialPage:_tabIndex );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //方案一Stack+Offstage
      body:PageView(
        controller: _pageController,
        children: pages,
        onPageChanged: _pageChangeMethod,
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(items:<BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.adb),title: Text("tab1")),
        BottomNavigationBarItem(icon: Icon(Icons.add_a_photo),title: Text("tab2")),
        BottomNavigationBarItem(icon: Icon(Icons.description),title: Text("tab3"))

      ]
      ,
        //tab选中颜色
        fixedColor: Colors.red,
        onTap:_tapTab ,
        currentIndex: _tabIndex,
        selectedFontSize: 12.0,
      ),
    );
  }

  void _tapTab(int value) {
      setState(() {
        this._tabIndex=value;
      });
      _pageController.jumpToPage(value);
  }

  //控制页面切换的方法

  void _pageChangeMethod(int value) {
    setState(() {
      this._tabIndex=value;
    });
  }
}