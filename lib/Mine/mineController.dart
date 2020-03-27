import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_yqjy/Base/Util.dart';

class MineController extends StatefulWidget {
  @override
  _MineControllerState createState() => _MineControllerState();
}

class _MineControllerState extends State<MineController> {
  Widget _cetifySliver(){
    return SliverToBoxAdapter(

    );
  }

  Widget _infoSliver(){
    return SliverToBoxAdapter(

    );
  }

  Widget _setSliver(){
    return SliverToBoxAdapter(

    );
  }

  Widget _personBasicInfo(){
     return Positioned(
       left: W(13),
       right: W(13),
       top: H(68),
       height: H(182),
       child: Stack(
         children: <Widget>[
           Positioned(
             left: 0,
             right: 0,
             top: 0,
             height: H(180),
             child: Container(
               width: W(330),
               height: H(180),
               child: Image.asset('./images/Mine/mine_whiteBg.png', fit: BoxFit.cover,),
            ),
             ),
          //  Positioned(
          //    left: W(25),
          //    top: H(23),
          //    width: W(64),
          //    height: W(64),
          //    child: FloatingActionButton(
          //      onPressed: ()=>print('点击头像'),
          //      child:Image.asset('./images/Mine/default_headIcon.png'),
          //      elevation: 0,
          //      shape: CircleBorder(),
          //    ),
          //  ),
          //  Positioned(
          //    top: H(23),
          //    left: W(102),
          //    child: Row(
          //      crossAxisAlignment: CrossAxisAlignment.center,
          //      children: <Widget>[
          //        Text('登录/注册', style: TextStyle(fontSize: 18,color: Colors.black),),
          //        FlatButton(
          //          onPressed: ()=>print('点击修改名字'), 
          //          child: Image.asset('./images/Mine/edit_name.png', fit: BoxFit.fill,),
          //          ),
          //      ],
          //    ),
          //  ),
          //  Positioned(
          //    top: H(23),
          //    right: W(27),
          //    width: W(30),
          //    height: W(30),
          //    child: FlatButton(
          //      onPressed: ()=>print('点击任务二维码'), 
          //      child: Image.asset('./images/Mine/mine_qrcode.png'),
          //      ),
          //  ),
          //  Positioned(
          //    left: W(102),
          //    bottom: H(104),
          //    child: Text('13147836410',style: TextStyle(fontSize: 12,color: color153()),),
          //  ),
          //  Positioned(
          //    left: 0,
          //    right: 0,
          //    top: H(104),
          //    height: 1,
          //    child: Container(
          //      color: colorRGB(220, 220, 220),
          //    ),
          //  ),
          //  Positioned(
          //    left: 0,
          //    right: 0,
          //    bottom: 0,
          //    top: H(104),
          //    child: Row(
          //      children: <Widget>[
          //        Container(
          //          child: FlatButton(
          //            onPressed: ()=> print(''), 
          //            child: Text('17.17元\n账户余额',style: TextStyle(fontSize: 20,color: colorRGB(31, 103, 33)),),),
          //        ),
          //        Container(
          //          child: FlatButton(
          //            onPressed: ()=> print(''), 
          //            child: Text('222.89元\n我的邀请',style: TextStyle(fontSize: 20,color: colorRGB(31, 103, 33)),),),
          //        ),
          //      ],
          //    ),
          //  ),
         ],
       ),
     );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('我的', style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
            centerTitle: false,
            expandedHeight: H(250),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    height: H(155),
                    child: Image.asset('./images/Home/top_bg.png',fit: BoxFit.fill,),
                  ),
                  _personBasicInfo(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(

          ),
          _cetifySliver(),
          _infoSliver(),
          _setSliver(),
        ],
      ),
    );
  }
}