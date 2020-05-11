import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterallinone/data/config/response_raw.dart';
import 'package:flutterallinone/data/model/pojos.dart';
import 'package:flutterallinone/pages/article_detail_page.dart';
import 'package:flutterallinone/util/dio_util.dart';
import 'package:flutterallinone/widget/over_scroll.dart';

class ArticleHolderWidget extends StatefulWidget{
  @override
  _ArticleHolderState createState() {
    // TODO: implement createState
    return _ArticleHolderState();
  }
}
class _ArticleHolderState extends State<ArticleHolderWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  FutureBuilder(
            future: DioUtil.getInstance().futureRequest("/article/list/1/json", (rawDataConvert){
              return ArticleListResponse.fromJson(rawDataConvert);
            }
            ),
            builder: _futureBuilder
          );
  }

  Widget _futureBuilder(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
        return Text("加载中");
      case ConnectionState.done:
        if (snapshot.hasError) {
          return Text("加载错误");
        } else {
          List<SingleArticle> listData=[];
          listData=snapshot.data.data.datas;
          return ScrollConfiguration(
            behavior: OverScrollBehavior(),
            child: ListView.builder(
                itemCount: listData.length,
                itemBuilder: (context,item){
                  return new Column(
                    children: <Widget>[
                      _buildListData(context, listData[item]),
                    ],
                  );
                }
            )
          );
        }
        break;
      default:
        return Container(width: 0.0,height: 0.0);
    }
  }

  Widget _buildListData(BuildContext context, SingleArticle itemData) {
      return Container(
        height: 80,
        padding: EdgeInsets.only(left: 20,right: 20),
        margin: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2))
        ),

        child: GestureDetector(
          onTap: (){
            _tapArticle(itemData);
          },
          child: Align(
              alignment: FractionalOffset(0.0,0.5),
              child: Text(
                  itemData.title,
                  textAlign: TextAlign.left
              )
          )
        ),
      );
  }



  void _tapArticle(SingleArticle itemData) {
    Navigator.push(context, new MaterialPageRoute(builder: (context){
      return  ArticleDetailPage(itemData.link);
    }));
  }
}