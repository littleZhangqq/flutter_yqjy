import 'package:flutter/material.dart';
import 'package:flutter_yqjy/Base/Util.dart';

class MineController extends StatefulWidget {
  @override
  _MineControllerState createState() => _MineControllerState();
}
class _MineControllerState extends State<MineController> {
  Widget _cetifySliver(){
    return SliverToBoxAdapter(
      child: Container(
        width: W(355),
        height: H(95),
        child: Stack(
          children: <Widget>[
          Positioned(
            left: W(9),
            right: W(9),
            child: Image.asset('./images/Mine/white_bg2x.png', fit: BoxFit.fitWidth,),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 3,
            bottom: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: H(45),
                  width: screenWidth()-W(36),
                  child: FlatButton(
                  onPressed: ()=> print('车主认证'), 
                  child: _sliverDetail(Icon(Icons.perm_contact_calendar,color: color102(),), '车主认证',true),
                ),
                ),
                Container(
                  height: H(45),
                  width: screenWidth()-W(36),
                  child: FlatButton(
                  onPressed: ()=> print('地址管理'), 
                  child: _sliverDetail(Icon(Icons.pin_drop,color: color102(),), '地址管理',false),
                ),
                ),
                
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _infoSliver(){
    return SliverToBoxAdapter(
      child: Container(
        width: W(355),
        height: H(140),
        child: Stack(
          children: <Widget>[
          Positioned(
            left: W(9),
            right: W(9),
            top: 0,
            bottom: 0,
            child: Image.asset('./images/Mine/white_bg3x.png', fit: BoxFit.fitWidth,),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 3,
            bottom: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: H(45),
                  width: screenWidth()-W(36),
                  child: FlatButton(
                  onPressed: ()=> print('我的任务'), 
                  child: _sliverDetail(Icon(Icons.touch_app,color: color102(),), '我的任务',true),
                ),
                ),
                Container(
                  height: H(45),
                  width: screenWidth()-W(36),
                  child: FlatButton(
                  onPressed: ()=> print('优惠券'), 
                  child: _sliverDetail(Icon(Icons.playlist_add_check,color: color102(),), '优惠券',true),
                ),
                ),
                Container(
                  height: H(45),
                  width: screenWidth()-W(36),
                  child: FlatButton(
                  onPressed: ()=> print('联系我们'), 
                  child: _sliverDetail(Icon(Icons.phone_forwarded,color: color102(),), '联系我们',false),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _setSliver(){
    return SliverToBoxAdapter(
      child: Container(
        width: W(355),
        height: H(50),
        child: Stack(
          children: <Widget>[
          Positioned(
            left: W(9),
            right: W(9),
            top: 0,
            bottom: 0,
            child: Image.asset('./images/Mine/white_bg1x.png', fit: BoxFit.fitWidth,),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 3,
            bottom: 2,
            child: Column(
              children: <Widget>[
                Container(
                  height: H(45),
                  width: screenWidth()-W(36),
                  child: FlatButton(
                  onPressed: ()=> print('设置'), 
                  child: _sliverDetail(Icon(Icons.settings,color: color102(),), '设置',false),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _loginliver(){
    return SliverToBoxAdapter(
      child: FlatButton(
          onPressed: ()=> print('登录'), 
          child: Text('去登录'),
          color: color235(),
       ),
    );
  }

  Stack _sliverDetail(Icon img,String title,bool showline){
    return Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: W(12),
            width: W(15),
            height: W(15),
            child: img,
        ),
        Positioned(
          top: W(12),
          left: W(30),
          child: Text(title,style: TextStyle(fontSize: 15,color: color153()),),
        ),
        Positioned(
           top: W(12),
           right: W(5),
           child: Icon(Icons.arrow_forward_ios,color: colorRGB(200, 200, 200),),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: H(44.5),
          height: H(0.5),
          child: Container(
            color: showline == true ? colorRGB(215, 215, 215) : colorClear(),
          ),
        ),
        ],
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
               child: Image.asset('images/Mine/mine_whiteBg.png', fit: BoxFit.cover,),
            ),
             ),
           Positioned(
             left: W(25),
             top: H(23),
             width: W(64),
             height: W(64),
             child: FloatingActionButton(
               onPressed: ()=>print('点击头像'),
               child:Image.asset('./images/Mine/default_headIcon.png'),
               elevation: 0,
               shape: CircleBorder(),
             ),
           ),
           Positioned(
             top: H(23),
             left: W(102),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Text('登录/注册', style: TextStyle(fontSize: 18,color: Colors.black),),
                 Container(
                   width: W(30),
                   height: W(30),
                   child: FlatButton(
                   onPressed: ()=>print('点击修改名字'), 
                   child: Icon(Icons.edit),
                   ),
                 ),
               ],
             ),
           ),
           Positioned(
             top: H(27),
             right: W(37),
             width: W(20),
             height: W(20),
             child: Container(
               child: Image.asset('./images/Mine/mine_qrcode.png',),
             ),
           ),
           Positioned(
             top: H(20),
             right: W(37),
             width: W(30),
             height: W(30),
             child: FlatButton(
               onPressed: ()=> print('二维码'),
               child: null,
             ),
           ),
           Positioned(
             left: W(102),
             bottom: H(104),
             child: Text('13147836410',style: TextStyle(fontSize: 13,color: color153()),),
           ),
           Positioned(
             left: 20,
             right: 20,
             top: H(104),
             height: 0.5,
             child: Container(
               color: colorRGB(220, 220, 220),
             ),
           ),
           Positioned(
             left: 0,
             right: 0,
             bottom: 0,
             top: H(90),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 FlatButton(
                     onPressed: ()=> print(''), 
                     child: RichText(
                       textAlign: TextAlign.center,
                       text: TextSpan(
                         text: '',
                         children: <TextSpan>[
                          TextSpan(
                            text: '1617.17',
                            style: TextStyle(fontSize: 21,color: colorRGB(31, 103, 33),fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: ' 元',
                            style: TextStyle(fontSize: 14,color: color153()),
                          ),
                          TextSpan(
                            text: '\n账户余额',
                            style: TextStyle(fontSize: 14,color: color102()),
                          )
                        ],
                       ),)
                       ),
                     //Text('17.17元\n账户余额',style: TextStyle(fontSize: 20,color: colorRGB(31, 103, 33)),),
                 FlatButton(
                     onPressed: ()=> print(''), 
                     child: RichText(
                       textAlign: TextAlign.center,
                       text: TextSpan(
                         text: '',
                         children: <TextSpan>[
                          TextSpan(
                            text: '221.09',
                            style: TextStyle(fontSize: 21,color: colorRGB(31, 103, 33),fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: ' 元',
                            style: TextStyle(fontSize: 14,color: color153()),
                          ),
                          TextSpan(
                            text: '\n我的邀请',
                            style: TextStyle(fontSize: 14,color: color102()),
                          )
                        ],
                       ),),
                       ),
               ],
             ),
           ),
           Positioned(
             left: (screenWidth()-W(26))/2,
             bottom: H(30),
             height: H(30),
             width: 0.5,
             child: Container(
               color: color153()
             ),
           ),
         ],
       ),
     );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorRGB(250, 250, 250),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('我的\n', style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
            centerTitle: false,
            expandedHeight: H(210),
            backgroundColor: colorRGB(245, 245, 245),
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
            child: Image.network('https://yiqi-shenyang.oss-cn-beijing.aliyuncs.com/uploads/images/20191004/move_car.gif'),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 10,
            ),
          ),
          _cetifySliver(),
          _infoSliver(),
          _setSliver(),
          _loginliver(),
        ],
      ),
    );
  }
}