import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MineController extends StatefulWidget {
  @override
  _MineControllerState createState() => _MineControllerState();
}

class _MineControllerState extends State<MineController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的" ,style: TextStyle(fontSize: 20,color: Colors.black),),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 1.5,
      ),
      body: _body(),
      backgroundColor: Colors.deepPurple,
    );
  }

  Widget _body(){
    return Container(

    );
  }
}