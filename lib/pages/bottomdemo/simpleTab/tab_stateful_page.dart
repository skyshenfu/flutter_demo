import 'package:flutter/material.dart';
///有状态的Tab页with AutomaticKeepAliveClientMixin<Tab1Page 不是必须的，只在可滚动的条件下用这个mixin实现状态保存
class Tab1Page extends StatefulWidget{
  final String centerText;
  final Color color;


   Tab1Page({Key key, this.centerText, this.color}) : super(key: key){
    print('new $key');
  }
  @override
  State<StatefulWidget> createState() {
    return _Tab1Page(centerText,color);
  }

}

class _Tab1Page extends State<Tab1Page> with AutomaticKeepAliveClientMixin<Tab1Page>{
   String centerText;
   Color color;
   int clickNumber=0;
   _Tab1Page(this.centerText, this.color);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(centerText,
        style: TextStyle(
            backgroundColor: color
        ),
        ),
      ),
      floatingActionButton: IconButton(icon: giveIcon(), onPressed: (){
        setState(() {
          clickNumber++;
        });
        
      })
    );
    
  }
  @override
  void initState() {
    super.initState();
    print("重新建立"+centerText);
  }
 @override
  bool get wantKeepAlive => true;

  Widget giveIcon(){
      if (clickNumber%4==0){
        return Icon(Icons.pages);

      } else if(clickNumber%4==1){
        return Icon(Icons.print);

      }
      else if(clickNumber%4==2){
        return Icon(Icons.access_alarm);

      }
      else{
        print(clickNumber%4);
        return Icon(Icons.date_range);
      }
    }
  }