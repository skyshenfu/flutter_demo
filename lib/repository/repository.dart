import 'package:dio/dio.dart';
import 'package:flutterallinone/data/config/api.dart';
import 'package:flutterallinone/data/model/pojos.dart';
import 'package:flutterallinone/util/dio_util.dart';

class APIRepository {
  static final _instance = APIRepository._();
  factory APIRepository.getInstance() => _instance;

  APIRepository._();
  //获取轮播图
  Future getBannersFuture({cancelToken:CancelToken}) {
    return DioUtil.getInstance().futureRequest(Api.BANNER, (listData) {
      List<SingleBanner> banners = [];
      listData.forEach((v) {
        banners.add(SingleBanner.fromJson(v));
      }
      );
      return banners;
    },cancelToken: cancelToken);
  }
  //获取文章
  Future getArticleFuture(int current,{page:CommonPageData,cancelToken:CancelToken,index:int}) {

    return DioUtil.getInstance().futureRequest("/article/list/$current/json",
            (pageData) {
          List<SingleArticle> articles = [];
          pageData['datas'].forEach((v) {
            articles.add(SingleArticle.fromJson(v));
          });
          return articles;
        });
  }
}
