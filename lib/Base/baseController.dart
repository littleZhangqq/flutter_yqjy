import 'package:flutter/material.dart';
import 'package:flutter_yqjy/Base/Util.dart';

class BaseController extends StatefulWidget {
  @override
  _BaseControllerState createState() => _BaseControllerState();
}

class _BaseControllerState extends State<BaseController> {
  var naviTitle = "";
  var backButton;
  

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(naviTitle,style: TextStyle(fontSize: 20,color: Colors.white)),
        backgroundColor: Colors.white,
      ),
      body: initViews(),
    );
  }

  Widget initViews(){
    return Container(
    );
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData(){
  }

  
}