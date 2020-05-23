import 'package:flutter/material.dart';
import 'package:flutterallinone/data/bloc/blocs.dart';

import 'bloc_demo_second_page.dart';

class BLoCDemoPage extends StatefulWidget {
  @override
  _BLoCDemoPageState createState() {
    // TODO: implement createState
    return _BLoCDemoPageState();
  }
}

class _BLoCDemoPageState extends State<BLoCDemoPage> {

  @override
  Widget build(BuildContext context) {
    final GlobalBLoC bloc = BlocProvider.of<GlobalBLoC>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => bloc.add(),
          child: Icon(Icons.add),

        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: StreamBuilder<int>(
                  builder: _builderProduce,
                  stream: bloc.currentPage,
                  initialData: bloc.numberCurrent,
                ),
              ),
              RaisedButton(onPressed: _jump)
            ],
          )
        )
    );
  }

  Widget _builderProduce(BuildContext context, AsyncSnapshot<int> snapshot) {
    var a=snapshot.data;
    return Text("次数$a");
  }

  void _jump() {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return BLoCDemo2Page();
    }));
  }
}