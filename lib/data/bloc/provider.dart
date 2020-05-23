//import 'package:flutter/material.dart';
//import 'package:flutterallinone/data/bloc/blocs.dart';
//
//class GlobalProvider extends InheritedWidget{
//    GlobalBLoC globalBLoC=new GlobalBLoC();
//
//  GlobalProvider({Key key, Widget child}) : super(key: key, child: child);
//
//  @override
//  bool updateShouldNotify(_) => true;
//
//  static GlobalBLoC of(BuildContext context) {
//    var result= context.dependOnInheritedWidgetOfExactType<GlobalProvider>();
//    var result1=result.globalBLoC;
//    return result1;
//  }
//
//
//}