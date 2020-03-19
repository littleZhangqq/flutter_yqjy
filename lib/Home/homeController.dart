import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_yqjy/Base/HttpUtil.dart';
import 'package:flutter_yqjy/Base/RequestSufix.dart';


class HomeController extends StatefulWidget {
  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  
  List<String> itemArray(){
    var array = [];
    for (var i = 0; i < 25; i++) {
      array.add(i.toString());
    }
    return array;
  }

  Widget _listItem(BuildContext context,int index){
    return Container(
      child: FlatButton(
        onPressed: ()=> print("object"),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Image.asset("./images/Home/home_cellbg.png", fit: BoxFit.fill,),
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
            ),
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                   image: new DecorationImage(image: NetworkImage("https://yiqi-shenyang-test.oss-cn-beijing.aliyuncs.com/uploads/images/20191230/1d2b4b41baddd7cbbd85fab344e03fac.png",),fit: BoxFit.fill),
                   shape: BoxShape.rectangle,
                   borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(14))),
                ),
              ),
              left: ScreenUtil().setWidth(54),
              top: ScreenUtil().setHeight(40),
              bottom: ScreenUtil().setHeight(40),
              width: ScreenUtil().setHeight(185),
            ),
            Positioned(
              left: ScreenUtil().setWidth(290),
              top: ScreenUtil().setHeight(35),
              child: Text("这是商家列表的标题" ,style: TextStyle(fontSize: 15,color: Colors.black)),
            ),
            Positioned(
              left: ScreenUtil().setWidth(290),
              top: ScreenUtil().setHeight(86),
              child: Text("这是商家列表的小标题" ,style: TextStyle(fontSize: 12,color: Colors.black45)),
            ),
            Positioned(
              left: ScreenUtil().setWidth(290),
              top: ScreenUtil().setHeight(134),
              child: Text("这是标签" ,style: TextStyle(fontSize: 10,color: Colors.black45)),
            ),
            Positioned(
              left: ScreenUtil().setWidth(290),
              bottom: ScreenUtil().setHeight(40),
              child: Text("这是底部" ,style: TextStyle(fontSize: 12,color: Colors.black45)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  initState(){
    super.initState();
  }


  Widget _topBgView(){
    return Stack(
      children: <Widget>[
        Container(
          width: ScreenUtil.screenWidth,
          height: ScreenUtil().setHeight(930),
          color: Colors.white,
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: ScreenUtil().setHeight(476),
          child: new Image.asset("./images/Home/top_bg.png",fit: BoxFit.fitWidth,),
        ),
        Positioned(
          top: ScreenUtil().setHeight(400),
          left: ScreenUtil().setWidth(132),
          right: ScreenUtil().setWidth(141),
          height: ScreenUtil().setHeight(114),
          child: FlatButton(
            onPressed: ()=> print("object"),
            child: Image.asset("./images/Home/oil_onekey.png",fit: BoxFit.fitWidth,),
            
          ),
        ),
        Positioned(
          left: ScreenUtil().setWidth(38),
          height: ScreenUtil().setWidth(60),
          width: ScreenUtil().setWidth(400),
          top: ScreenUtil().setHeight(528),
          child: Text("这里是1滚动信息发布",style: TextStyle(fontSize: 15,color: Colors.black87),),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: ScreenUtil().setHeight(580),
          height: ScreenUtil().setHeight(247),
          child: Swiper(
            // color: Colors.yellowAccent,
            itemCount: 3,
            itemBuilder: (BuildContext context,int index) {
              return new Image.network("http://img.zcool.cn/community/01fea85739312e6ac72580ed798d33.jpg" ,fit:BoxFit.fill);
            },
            pagination: new SwiperPagination(margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10))),
            autoplay: true,
            
          ),
        ),
        Positioned(
          left: ScreenUtil().setWidth(38),
          height: ScreenUtil().setHeight(30),
          top: ScreenUtil().setHeight(855),
          child: Image.asset("./images/Home/task_icon.png" ,fit: BoxFit.fill,),
        ),
        Positioned(
          child: Container(
            width: ScreenUtil().setHeight(80),
            height: ScreenUtil().setHeight(80),
            decoration: BoxDecoration(
              image: new DecorationImage(image: NetworkImage("https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=605585087,1627229068&fm=26&gp=0.jpg") ,fit: BoxFit.cover),
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
          ),
          left: ScreenUtil().setWidth(38),
          top: ScreenUtil().setHeight(76),
        ),
        Positioned(
          left: ScreenUtil().setWidth(155),
          top: ScreenUtil().setHeight(76),
          child: Text("沈阳市" ,style:TextStyle(fontSize:12, color: Colors.grey[300])),
          height: 20,
        ),
        Positioned(
          left: ScreenUtil().setWidth(155),
          top: ScreenUtil().setHeight(120),
          child: Text("奥体中心加油站 距您1.5KM" ,style:TextStyle(fontSize:11, color: Colors.grey[300])),
          height: 20,
        ),
        Positioned(
          right: ScreenUtil().setWidth(48),
          top: ScreenUtil().setHeight(70),
          width: 50,
          height: 50,
          child: FlatButton(
            onPressed: ()=> print("点击拍照"),
            child: Image.asset("./images/Home/saoyisao.png",fit: BoxFit.fill,),
          ),
        ),
        Positioned(
          child: Image.asset("./images/Home/saveOilFee.png"),
          left: ScreenUtil().setWidth(150),
          top: ScreenUtil().setHeight(194),
          width: 114,
          height: 22,
        ),
        Positioned(
          child: Image.asset("./images/Home/earnMoney.png"),
          right: ScreenUtil().setWidth(150),
          top: ScreenUtil().setHeight(194),
          width: 114,
          height: 22,
        ),
        Positioned(
          left: ScreenUtil().setWidth(170),
          top: ScreenUtil().setHeight(254),
          width: 100,
          height: 50,
          child: RichText(
             text: TextSpan(
                text: "650",
                style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600),
                children: <TextSpan>[
                  TextSpan(text:".",style: TextStyle(fontSize: 20)),
                  TextSpan(text:"42",style: TextStyle(fontSize: 20))
                ],
              ),
         ),
        ),
        Positioned(
          right: ScreenUtil().setWidth(170),
          top: ScreenUtil().setHeight(254),
          width: 100,
          height: 50,
          child: RichText(
             text: TextSpan(
                text: "150",
                style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600),
                children: <TextSpan>[
                  TextSpan(text:".",style: TextStyle(fontSize: 20)),
                  TextSpan(text:"37",style: TextStyle(fontSize: 20))
                ],
              ),
         ),
        ),
        Positioned(
          child: Image.asset("./images/Home/lastSave.png"),
          left: ScreenUtil().setWidth(100),
          top: ScreenUtil().setHeight(344),
          width: 100,
          height: 20,
        ),
        Positioned(
          left: ScreenUtil().setWidth(380),
          top: ScreenUtil().setHeight(349),
          child: Text("+230.21",style: TextStyle(color: Colors.white),)
        ),
        Positioned(
          child: Image.asset("./images/Home/taskEarn.png"),
          right: ScreenUtil().setWidth(230),
          top: ScreenUtil().setHeight(344),
          width: 100,
          height: 20,
        ),
        Positioned(
          left:  300,
          right: ScreenUtil().setWidth(60),
          top: ScreenUtil().setHeight(349),
          child: Text("+230.21",style: TextStyle(color: Colors.white),)
        ),
      ],
    );
  }

  void getAppInitData(){
    HttpUtil.instance.postData(appInit, {'':''}, RequestLisener(onSucessLisener: (BaseResponse rep){
      print(rep.data);
    },onFailLisener: (String msg){
      print(msg);
    }));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    getAppInitData();
    return Material(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _topBgView(),
          ),
          SliverFixedExtentList(
            itemExtent: ScreenUtil().setHeight(265),
            delegate: SliverChildBuilderDelegate((BuildContext context, int index){
              return _listItem(context, index);
            },
            childCount: 20,
            ),
          ),
        ],
      ),
    );

  }
}