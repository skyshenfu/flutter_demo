import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutterallinone/data/config/api.dart';
import 'package:flutterallinone/data/config/response_raw.dart';

class DioUtil {
  static final _instance = DioUtil._();
  static Map<String,dynamic> _header={"token": ""};
  static const int _post_method=1;
  static const int _get_method=0;

  static  BaseOptions _baseOptions = BaseOptions(
    //基础地址
    baseUrl: Api.baseUrl,
    //连接超时
    connectTimeout: 5000,
    //接收超时
    receiveTimeout: 5000,
    //发送超时
    sendTimeout: 5000,
    //请求头
    headers:_header

  );
  Dio _dio;
  factory DioUtil.getInstance() => _instance;

  DioUtil._(){
    _dio=Dio(_baseOptions);
  }

  //简单请求，没有返回值，类似于java的回调处理
  //默认为get形式的请求
  void simpleRequest(String path,{
    int requestMethod=_get_method,
    Function successCallBack,
    Function errorCallBack,
    Map<String, dynamic> parameters,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
    Options options
  }) async {
    try{

      Response response;
      if(requestMethod==_post_method){
        response=await _dio.post(path,queryParameters: parameters, cancelToken: cancelToken,onReceiveProgress: onReceiveProgress,options: options);
      }else{
        response= await _dio.get(path,queryParameters: parameters, cancelToken: cancelToken,onReceiveProgress: onReceiveProgress,options: options);
      }
      LinkedHashMap linkedHashMap=response.data;
      int code=linkedHashMap['errorCode'];
      String msg=linkedHashMap['errorMsg'];
      if(code==0){
        successCallBack(response.data);
      }else{
        throw new BusinessError(code, msg);
      }
    }catch(e){
      errorCallBack(e);
    }

  }


  //网络请求，返回一个future rawDataConvert为对返回结果的加工，返回的数据为FutureBuilder state切换为done且没有error的情况
  //默认为get形式的请求
  Future futureRequest(String path, Function rawDataConvert,{
    int requestMethod=_get_method,
    Map<String, dynamic> parameters,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
    Options options
  }) async {
    try{
      Response response = await _dio.get(path,queryParameters: parameters, cancelToken: cancelToken,onReceiveProgress: onReceiveProgress,options: options);
      LinkedHashMap linkedHashMap=response.data;
      int code=linkedHashMap['errorCode'];
      String msg=linkedHashMap['errorMsg'];

      if(code==0){
        return Future.value(rawDataConvert(linkedHashMap['data']));
      }else{
        throw new BusinessError(code, msg);
      }
    }catch(e){
      return Future.error(e);
    }
  }

  void refreshToken(String token){
    _header["token"]=token;
  }

}
//用来放置业务上错误的类型
class BusinessError extends Error{
  final int code;
  final String message;

  BusinessError(this.code, this.message);


}