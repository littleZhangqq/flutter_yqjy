
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

// String requestHost = 'https://api.lnyqcm.com/v2/';
String requestHost = 'https://www.yiqijiayou00598.com/v2/';
String appInit = 'index/initV2';
String homeInfo = 'index/info';
