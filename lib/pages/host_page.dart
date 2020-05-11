import 'package:flutter/material.dart';
import 'package:flutterallinone/pages/article_holder_page.dart';
import 'package:flutterallinone/pages/leader_page.dart';
import 'package:flutterallinone/widget/over_scroll.dart';

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
  final titleStr = "PageView实现，可滚动";
  int _tabIndex;
  var _pageController;
  final pages = <Widget>[
    new LeaderPageWidget(),
    Container(),
    Container(),
  ];
  void _pressLeft() {
    print("点击第一按钮");
  }

  @override
  void initState() {
    super.initState();
    this._tabIndex = 0;
    this._pageController = new PageController(initialPage: _tabIndex);
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
      body: ScrollConfiguration(
        behavior: OverScrollBehavior(),
        child: PageView(
          controller: _pageController,
          children: pages,
          onPageChanged: _pageChangeMethod,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.adb), title: Text("tab1")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo), title: Text("tab2")),
          BottomNavigationBarItem(
              icon: Icon(Icons.description), title: Text("tab3"))
        ],
        //tab选中颜色
        fixedColor: Colors.lightBlue,
        onTap: _tapTab,
        currentIndex: _tabIndex,
        selectedFontSize: 12.0,
      ),
    );
  }

  void _tapTab(int value) {
    setState(() {
      this._tabIndex = value;
    });
    _pageController.jumpToPage(value);
  }

  //控制页面切换的方法

  void _pageChangeMethod(int value) {
    setState(() {
      this._tabIndex = value;
    });
  }
}
