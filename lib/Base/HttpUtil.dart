import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yqjy/Base/requestSufix.dart';
import 'package:shared_preferences/shared_preferences.dart';


typedef sucBlock = void Function(String json);
typedef failBlock = void Function(int code,String msg);

class HttpUtil{
  static const _post = 'post';
  static const _get = 'get';
  static HttpUtil _instance;
  static HttpUtil get instance => _getInstance();
  factory HttpUtil() => _getInstance();
  static HttpUtil _getInstance() {
    if (_instance == null) {
      _instance = HttpUtil._internal();
    }
    return _instance;
  }

  ///初始化
  HttpUtil._internal() {
    // _dio = Dio();
    // _dio = Dio(BaseOptions(      
    // ));
    // var headers = Map<String, String>();
    // headers['Content-Type'] = 'application/json,text/html,text/json,text/javascript';
    // _dio.options.headers.addAll(headers);
    // _addDioHandle(_dio); //添加请求之前的拦截器
  }

  void getData(String url,Map param,RequestLisener lisener){
    if(url.contains('http')){
      request(url, param, _get, lisener);
    }else{
      request(requestHost+url, param, _get, lisener);
    }
  }

  void postData(String url,Map param,RequestLisener lisener){
    if (url.contains('http')){
      request(url ,param, _post, lisener);
    }else{
      request(requestHost+url ,param, _post, lisener);
    }
  }
  
  void request(String url,Map param,String method,RequestLisener lisener) async{
    if(param == null){
      param = Map();
    }
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    param['token'] = token;
    param['timestamp'] = interval;
    param['key'] = key;
    param['sign'] = md5Result(md5Result(interval.toString())+key+keySufix);
    print('请求的URL是:$url');
    Dio dio = new Dio();
    
    dio.options.baseUrl = url;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    _addDioHandle(dio);
    try {
      Response rep;
      if(method == _get){
        rep = await dio.get(url);
      }else{
        rep = await dio.post(url, data: param, options:null);
      }

      Map map = jsonDecode(rep.toString());
      BaseResponse response = BaseResponse(int.parse(map['code']),map['msg'],map['data']);
      if(response.code == 200){
        lisener.onSucess(response);
      }else if(response.code == 100203){
        print('登录已过期，请重新登录');
      }else{
        lisener.onError(response);
      }
    } catch (exception) {
    }
  }

   _addDioHandle(Dio dio){
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options) {
      //请求发出前要做的事，loading，提示，检测网络等
      
    },onResponse: (Response rep) {
      //请求后要做的事 取消loading，给出提示，发出对应通知等等
    },onError: (DioError err) {
      //请求错误后的操作，给个提示，加个计划等等
    },));
  }
}

///返回对象封装
class BaseResponse<T>{
  int code;
  String msg;
  T data;
  BaseResponse(this.code,this.msg,this.data);
}

//请求结果监听
class RequestLisener<T>{
  RequestLisener({@required this.onSucessLisener,@required this.onFailLisener});

  final ValueChanged<BaseResponse> onSucessLisener;
  final ValueChanged<BaseResponse> onFailLisener;

  void onSucess(BaseResponse rep){
    if(onSucessLisener != null){
      onSucessLisener(rep);
    }
  }

  void onError(BaseResponse rep){
    if(onFailLisener != null){
      onFailLisener(rep);
    }
  }
}