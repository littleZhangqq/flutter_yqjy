import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_yqjy/Base/httpUtil.dart';
import 'package:flutter_yqjy/Base/util.dart';
import 'package:flutter_yqjy/Base/record.dart';
import 'package:flutter_yqjy/Base/requestSufix.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends StatefulWidget {
  @override
  _LoginControllerState createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  TapGestureRecognizer _tap;
  String userName;
  String userPassWord;
  String verifyCode;
  bool loginTypePassWord;
  @override
  void initState() {
    loginTypePassWord = true;
    _tap = TapGestureRecognizer();
    _tap.onTap = (){
      print('点击协议');
      Fluttertoast.showToast(msg: '点击协议',gravity: ToastGravity.CENTER);
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 10,
            top: H(25),
            height: 30,
            child: FlatButton(
              onPressed: ()=>print('点击跳过'), 
              child: Text('跳过',style: TextStyle(fontSize: 18,color: color102()),),),
          ),
          Positioned(
            left: W(18),
            top: H(70),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '您好，\n\n',
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.black),
                  ),
                  TextSpan(
                    text: '欢迎来到易起加油',
                    style: TextStyle(fontSize: 18,color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: H(170),
            child: Padding(
              padding: EdgeInsets.only(left: 20 ,right: 20),
              child: _centerBoxWidget(),
            ),
          ),
          Positioned(
            height: H(40),
            left: W(18),
            right: W(18),
            top: H(390),
            child: FlatButton(
              onPressed: (){
                print('点击登录');
                if(checkInputValue() == false){
                  return;
                }
                loginAction().then((token){
                  print('token:'+token);
                  return token;
                }).then((value){
                  return loadPersonInfo();
                }).then((value) {
                  print('登录后刷新各页面状态');
                });
              },
              child: Text('登录',style: TextStyle(fontSize: W(15),color: Colors.white),),
              color: colorRGB(30, 95, 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Positioned(
            left: W(18),
            top: H(440),
            child: FlatButton(
              child: Text('验证码登录', style: TextStyle(fontSize: 15,color: color51()),),
              onPressed: ()=> (loginTypePassWord = !loginTypePassWord),
            ),
          ),
          Positioned(
            right: W(18),
            top: H(440),
            child: FlatButton(onPressed: ()=>print('点击忘记密码'), child: 
              Text('忘记密码?', style: TextStyle(fontSize: 15,color: color153()),),
            ),
          ),
          Positioned(
            top: H(580),
            left: (screenWidth()-W(60))/2,
            width: W(80),
            height: W(80),
            child: FlatButton(onPressed: ()=>print('微信登录'), 
            child: 
              Image.asset('./images/Login/wxLogin.png',fit: BoxFit.fill,),
              splashColor: colorClear(),
              highlightColor: colorClear(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _centerBoxWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
            decoration: InputDecoration(
              errorMaxLines: 11,
              icon: Icon(Icons.people),
              hintText: '请输入手机号码',
              labelText: '用户名',
              hintStyle: TextStyle(fontSize: 14, color: color153(),
              ),
              counterText: '',
            focusedBorder: UnderlineInputBorder(
               borderSide: BorderSide(
                 color: color153(),
                 width: 1,
               ),
            ),
            ),maxLength: 11,
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Colors.black),
            enableInteractiveSelection: false,
            inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
            onChanged: (value){
              if(value.length > 0){
                userName = value;
              }
            },
        ),
        Container(
          height: 10,
        ),
        TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.security),
              errorMaxLines: 16,
              hintText: '请输入密码',
              labelText: '密码',
              suffixIcon: Icon(Icons.remove_red_eye),
              hintStyle: TextStyle(fontSize: 14, color: color153(),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: color153(),
                  width: 1
                ),
              ),
              counterText: ''
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            maxLength: 16,
            style: TextStyle(color: Colors.black),
            enableInteractiveSelection: false,
            onChanged: (value){
              if(value.length > 0){
                userPassWord = value;
              }
            },
        ),
        Padding(
          padding: EdgeInsets.only(top: 20,left: W(30)),
          child: RichText(text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: '温馨提示：登录即表示同意',
                style: TextStyle(fontSize: 14,color: color153()),
              ),
              TextSpan(
                text: '《易起加油服务协议》',
                style: TextStyle(fontSize: 14,color: colorRGB(41, 113, 43)),
                recognizer: _tap,
              ),
            ],
          ),),
        ),
      ],
    );
  }

  Future loginAction(){
    Map param = Map();
    param['tel'] = userName;
    param['login_type'] = 'app';
    if(loginTypePassWord == true){
      param['password'] = userPassWord;
    }else{
      param['code'] = verifyCode;
    }
    String token;
    final complete = Completer();
    final future = complete.future;
    EasyLoading.show(status: '登录中');
    HttpUtil.instance.postData(loginTypePassWord ? loginWithPwd : loginWithCode, param, RequestLisener(onSucessLisener: (BaseResponse rep) async{
      EasyLoading.dismiss();
      EasyLoading.show(status: '登录中');
      token = await rep.data['token'];
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove('token');
      saveValue(token, 'token');
      complete.complete(token);
    }, onFailLisener: (BaseResponse rep){
      Fluttertoast.showToast(msg: rep.msg);
      EasyLoading.dismiss();
    }));
    return future;
  }

  UserRecord person;
  Future loadPersonInfo(){
    final complete = Completer();
    final future = complete.future;
    HttpUtil.instance.postData(personInfo, null, RequestLisener(onSucessLisener: (BaseResponse rep) async{
      UserRecord record = UserRecord.fromJson(rep.data);
      saveObject(record);
      Fluttertoast.showToast(msg: '登录成功',gravity: ToastGravity.CENTER);
      Future.delayed(Duration(seconds: 1),(){
        Navigator.pop(context);
      });
      person = await getUserData();
      EasyLoading.dismiss();
      print('登录成功');
      complete.complete();
    },onFailLisener: (BaseResponse rep){
      Fluttertoast.showToast(msg: rep.msg,gravity: ToastGravity.CENTER);
      EasyLoading.dismiss();
    }));
    return future;
  }

  bool checkInputValue(){
    if(userName.length < 11){
      Fluttertoast.showToast(msg: '请输入正确的手机号');
      return false;
    }else if(userPassWord.length < 6 && loginTypePassWord){
      Fluttertoast.showToast(msg: '请输入正确的密码');
      return false;
    }else if(userPassWord.length < 6 && !loginTypePassWord){
      Fluttertoast.showToast(msg: '请输入正确的验证码');
      return false;
    }
    return true;
  }
}