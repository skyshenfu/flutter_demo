import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutterallinone/data/config/api.dart';
import 'package:flutterallinone/data/config/response_raw.dart';

class DioUtil {
  static final _instance = DioUtil._();
  static Map<String,dynamic> _header={"token": ""};

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

  //一个get请求
  Future<dynamic> getRequest(String path,{
    Map<String, dynamic> parameters,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
    Options options
  }) async {
    try{
      Response response = await _dio.get(path,queryParameters: parameters, cancelToken: cancelToken,onReceiveProgress: onReceiveProgress,options: options);
      return processData(RawResponse.fromJson(response.data));
     
    }catch(e){
      return Future.error(e);
    }

  }


  dynamic processData(RawResponse result) {
    if(result.errorCode==0){
      return result.data;
    }else{
      throw BusinessError(result.errorCode,result.errorMsg);
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