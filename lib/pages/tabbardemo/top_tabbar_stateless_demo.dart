
import 'package:flutter/material.dart';

class TopTabBarLessDemo extends StatelessWidget{
  final List<Tab> tabs = <Tab>[
    Tab(text: "tab1"),
    Tab(text: "tab2")
  ];
  @override
  Widget build(BuildContext context) {
    return   Material(
      color:  Colors.deepPurpleAccent,
      child: DefaultTabController(length: tabs.length, child: Column(
        children: <Widget>[
          SafeArea(child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            height: 0.0,
            decoration: BoxDecoration(
                color: Colors.green
            ),
          ),
            bottom: false,
          ),
          Container(
            child: TabBar(tabs: tabs,
              isScrollable: false ,
              indicatorColor:Colors.amberAccent,
              unselectedLabelColor: Colors.black87,
              labelColor: Colors.red,
              indicatorWeight: 4.0,
            ),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),

          Expanded(
              child:  TabBarView(children: tabs.map((Tab tab){
                return Center(child: Text(tab.text));
              }).toList(),
                //这个属性用来控制禁止滚动
                //physics: NeverScrollableScrollPhysics(),
              )
          )


        ],
      ),

      )

    );
  }
}
