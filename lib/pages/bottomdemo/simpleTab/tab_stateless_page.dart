import 'package:flutter/material.dart';

///无状态的Tab页,仅用来和有状态的作对比
class TabPage extends StatelessWidget{
  final String centerText;

  const TabPage({Key key, this.centerText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Text(centerText),
      ),
    );
  }

}