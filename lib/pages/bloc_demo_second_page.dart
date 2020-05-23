import 'package:flutter/material.dart';
import 'package:flutterallinone/data/bloc/blocs.dart';

class BLoCDemo2Page extends StatefulWidget {
  @override
  _BLoCDemoPage2State createState() {
    // TODO: implement createState
    return _BLoCDemoPage2State();
  }
}

class _BLoCDemoPage2State extends State<BLoCDemo2Page> {
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
            ],
          )
        )
    );
  }

  Widget _builderProduce(BuildContext context, AsyncSnapshot<int> snapshot) {
    var a=snapshot.data;
    return Text("次数$a");
  }
}