import 'dart:async';
import 'package:flutter/material.dart';
//基础的Bloc
abstract class BlocBase {
  //解除绑定，释放资源
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    BlocProvider<T> provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider.bloc;
  }
  //返回泛型类型
  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}



class GlobalBLoC implements BlocBase{
  int _number;
  StreamController<int> _numberController=StreamController<int>.broadcast();
  Stream<int> get currentPage => _numberController.stream;
  int get numberCurrent=>_number;

  GlobalBLoC(){
    _number=0;
  }

  add(){
    _number=_number+1;
    _numberController.sink.add(_number);
  }
  refresh(){
    _numberController.sink.add(_number);
  }

  dispose(){
    _numberController.close();
  }
  
}