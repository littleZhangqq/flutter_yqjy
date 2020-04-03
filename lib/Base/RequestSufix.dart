
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

String key = 'BCF319B377825C157A9EDBD9240BB90E';
String keySufix = 'yiqi';
int interval = new DateTime.now().millisecondsSinceEpoch;

String md5Result(String data){
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}

//域名前缀
// String requestHost = 'https://api.lnyqcm.com/v2/';
String requestHost = 'https://www.yiqijiayou00598.com/v2/';
// String imageHomst = 'https://yiqi-shenyang.oss-cn-beijing.aliyuncs.com';
String imageHost = 'https://yiqi-shenyang-test.oss-cn-beijing.aliyuncs.com/';

//首页接口
String appInit = 'index/initV2';//APP启动广告等
String homeInfo = 'index/info';//首页数据

//油站
//易兑
String exchange = 'exchange/exchange_list';//易兑商品列表

//登录
String loginWithPwd = 'login/login_pw';//密码登录
String loginWithCode = 'login/login_code';//验证码登录
String personInfo = 'login/is_login';//个人信息