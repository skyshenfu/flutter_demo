
import 'package:flutter/material.dart';

class TopTabBarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TopTabBarDemoState();
  }
}

class _TopTabBarDemoState extends State<TopTabBarDemo>{
  final List<Tab> tabs = <Tab>[
    Tab(text: "tab1"),
    Tab(text: "tab2")
  ];
  @override
  Widget build(BuildContext context) {
    return  getContainerWidget();
  }
  Widget getContainerWidget(){
      return Material(
        color:  Colors.deepPurpleAccent,
        child: Column(
            children: <Widget>[
              SafeArea(child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                height: 56.0,
                decoration: BoxDecoration(
                    color: Colors.green
                ),
              ),
                bottom: false,
              )
              ,Container(
                  color: Colors.white,
                  child: Center(
                    child:  DefaultTabController(length: tabs.length, child:Column(
                      children: <Widget>[
                        TabBarView(
                          children: tabs.map((Tab tab){
                            return Center(child: Text(tab.text));
                          }).toList(),
                        )
                      ],
                    )),
                  ),

                ),

            ]
        ),
      );
  }
}
