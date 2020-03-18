import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_yqjy/Base/HttpUtil.dart';
import 'package:flutter_yqjy/Base/RequestSufix.dart';
import 'package:flutter_yqjy/Base/Util.dart';

class GasController extends StatefulWidget {
  @override
  _GasControllerState createState() => _GasControllerState();
}

class _GasControllerState extends State<GasController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: AppBar(
        title: Text("加油",style: TextStyle(fontSize: 20,color: Colors.black),),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 1,
        actions: <Widget>[
          IconButton(
            icon: Image.asset("./images/Home/history_order.png"),
            onPressed: () => print("历史记录"),
            )
        ],
      ),
      body: _body(),
    );
  }

  Widget _body(){
    return Stack(
      children: <Widget>[
        Positioned(
          left:0,
          right: 0,
          top: 0,
          height: H(45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: W(100),
                child: FlatButton(
                  onPressed: () => print(""),
                  child: Row(
                      children: <Widget>[
                        Text("    92#", style: TextStyle(fontSize: W(12),color: Color.fromRGBO(131, 135, 142, 1)),),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
              ),
              Container(
                child: FlatButton(
                  onPressed: () => print(""),
                  child: Row(
                      children: <Widget>[
                        Text("全部品牌",style: TextStyle(fontSize: W(12),color: Color.fromRGBO(131, 135, 142, 1)),),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
              ),
              Container(
                child: FlatButton(
                  onPressed: () => print(""),
                  child: Row(
                      children: <Widget>[
                        Text("综合排序",style: TextStyle(fontSize: W(12),color: Color.fromRGBO(131, 135, 142, 1)),),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
              )
            ],
          ),
        ),
        Positioned(
          top: H(45),
          left: 0,
          right: 0,
          bottom: 0,
          child: ListView.separated(itemBuilder: (context,index){
            return _item();
          }, separatorBuilder: (context,index){
            return Container(
              height: 1,
              color: Color.fromRGBO(235, 235, 235, 1),
            );
          }, itemCount: 20),
        ),
      ],
    );
  }

  Widget _item(){
    return Container(
      height: H(135),
      child: Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            decoration: BoxDecoration(
                   image: new DecorationImage(image: NetworkImage("https://yiqi-shenyang-test.oss-cn-beijing.aliyuncs.com/uploads/images/20191230/1d2b4b41baddd7cbbd85fab344e03fac.png",),fit: BoxFit.fitHeight),
                   shape: BoxShape.rectangle,
                   borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
          ),
          left: W(19),
          top: H(15),
          height: H(78),
          width: W(75),
        ),
        Positioned(
          child: Text("加油站名称",style: TextStyle(fontSize: W(16),fontWeight: FontWeight.bold),),
          left: W(107),
          top: H(17),
        ),
        Positioned(
          child: Text("加油站位置",style: TextStyle(fontSize: W(11),color: Color.fromRGBO(134, 137, 145, 1)),),
          left: W(107),
          top: H(45),
        ),
        Positioned(
          left: W(107),
          top: H(70),
          child: RichText(
            text: TextSpan(
              text: "￥",
              style: TextStyle(fontSize: W(11),color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: "9.36  ",
                  style: TextStyle(fontSize: W(22),color: Colors.black,fontWeight: FontWeight.w500)
                ),
                TextSpan(
                  text: "油站价",
                  style: TextStyle(fontSize: W(11),color: Color.fromRGBO(124, 128, 136, 1))
                ),
                TextSpan(
                  text: "￥4.31  ",
                  style: TextStyle(fontSize: W(11),decoration: TextDecoration.lineThrough,decorationColor: Colors.black,color: Color.fromRGBO(124, 128, 136, 1))
                ),
                TextSpan(
                  text: "省 0.54",
                  style: TextStyle(fontSize: W(11),color: Color.fromRGBO(250, 45, 83, 1))
                )
              ],
            )),
        ),
        Positioned(
          left: W(107),
          top: H(108),
          child: Text(
            "加油赠送汽油1瓶，满150送洗",
            style:TextStyle(fontSize: W(12),color: Color.fromRGBO(255, 73, 106, 1))
          ),
        ),
        Positioned(
          child:FlatButton(
            onPressed: () => print(""), 
            highlightColor: Colors.white,
            splashColor: Colors.white,
            child: Container(
            width: W(70),
            height: H(26),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(H(13))),
              border: Border.all(width: 1,color: Color.fromRGBO(0, 0, 0, 0.2)),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  child: Icon(Icons.call_missed_outgoing),
                  padding: EdgeInsets.only(left: W(5)),
                ),
                Padding(
                  child: Text(" 3km"),
                  padding: EdgeInsets.only(right: 4),),
              ],
            ),
          ),
          ),
          top: H(17),
          right: W(19),
          height: H(26),
        ),
      ],
    ),
    );
  }

  void loadData(){
   
  }
}