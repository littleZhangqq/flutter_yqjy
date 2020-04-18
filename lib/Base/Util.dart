import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_yqjy/Base/record.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 设置宽度 按照设计图尺寸是iPhone6的宽度为固定参照，当前控件在设计图所占的宽度比例，乘以当前
double W(double width){
    double compare = width/375.0;
    return (ScreenUtil.screenWidth/ScreenUtil.pixelRatio) * compare;
  }
///设置高度 按照设计图尺寸是iPhone6的宽度为固定参照，当前屏幕宽度除以iPhone6屏幕宽度是当前设备的宽度比，在这款设备上宽度已经放大或缩小了这个比例，高度也要保持这个宽高比  否则会出现宽高比不一致的问题
double H(double height){
    return height *((ScreenUtil.screenWidth/ScreenUtil.pixelRatio)/375.0);
  }

double screenWidth(){
  return ScreenUtil.screenWidth / ScreenUtil.pixelRatio;
}

double screenHeight(){
  return ScreenUtil.screenHeight / ScreenUtil.pixelRatio;
}

Color color153(){
  return Color.fromRGBO(153, 153, 153, 1);
}

Color colorRGB(int r,int g,int b){
  return Color.fromRGBO(r, g, b, 1);
}

Color colorClear(){
  return Color.fromRGBO(0, 0, 0, 0);
}

Color color235(){
  return Color.fromRGBO(235, 235, 235, 1);
} 

Color color102(){
  return Color.fromRGBO(102, 102, 102, 1);
}

Color color51(){
  return Color.fromRGBO(51, 51, 51, 1);
}

void saveValue(Object value,String key) async{
  var pref = await SharedPreferences.getInstance();
  if(value is int){
    pref.setInt(key, value);
  }else if(value is String){
    pref.setString(key, value.toString());
  }else if(value is double){
    pref.setDouble(key, value.toDouble());
  }else if(value is bool){
    pref.setBool(key, value);
  }else if(key.contains('Record')){
    pref.setString(key, jsonEncode(value.toString()));
  }else{
    print('类型不对');
  }
}

Object getValue(String key) async{
  var pref = await SharedPreferences.getInstance();
  var result;
  if(pref.getBool(key) == null){
    if(pref.getDouble(key) == null){
      if(pref.getInt(key) == null){
        if(pref.getString(key) == null){
          print('null');
          result = '';
        }else{
          result = pref.getString(key);
        }
      }else{
        result = pref.getInt(key);
      }
    }else{
      result = pref.getDouble(key);
    }
  }else{
    result = pref.getBool(key);
  }
  return result;
}

void saveObject(Object value) async{
  var pref = await SharedPreferences.getInstance();
  pref.setString('userRecord', jsonEncode(value).toString());
}

Future<UserRecord> getUserData() async{
  var pref = await SharedPreferences.getInstance();
  String json = pref.getString('userRecord');
  Map<String, dynamic> result = jsonDecode(json);
  UserRecord record = UserRecord.fromJson(result);
  return record;
}

Future<bool> showAlert(BuildContext context,String title,String msg,List btnTitles){
    return showDialog(
      context: context,
      builder: (context){
        if(btnTitles.length == 1){
          return AlertDialog(
            title: Text(title),
            content: Text(msg),
            actions: <Widget>[
                FlatButton(
                onPressed: (){
                  Navigator.of(context,).pop(btnTitles[0] == '取消' ? true : false);
                }, 
                child: Text(btnTitles[0])),
              ],
          );
        }else{
          return AlertDialog(
            title: Text(title),
            content: Text(msg),
            actions: <Widget>[
                FlatButton(
                onPressed: (){
                  Navigator.of(context).pop(btnTitles[0] == '取消' ? true : false);
                },
                child: Text(btnTitles[0])),
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop(btnTitles[1] == '取消' ? true : false);
                },
                child: Text(btnTitles[1])),
              ],
          );
        }
      }
    );
  }

  Future<bool> showView(BuildContext context,String title,List<Widget> list){
    return showDialog(
      context: context,
      builder: (contecxt){
        return SimpleDialog(
          children: list,
          title: Text(title),
        );
      }
    );
  }

  Future<int> showBtmSheet(BuildContext context,List<String> titles){
    return showModalBottomSheet(
      context: context, 
      builder: (contect){
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(titles[index]),
                onTap: (){
                  Navigator.of(context).pop(index);
                },
              );
            },
            itemCount: titles.length,
          );
        },
      );
  }