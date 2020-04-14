import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_yqjy/Base/httpUtil.dart';
import 'package:flutter_yqjy/Base/requestSufix.dart';
import 'package:amap_location/amap_location.dart';
import 'package:flutter_yqjy/Base/util.dart';
import 'package:permission_handler/permission_handler.dart';//权限
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_yqjy/Home/Model/homeRecord.dart';

class HomeController extends StatefulWidget {
  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  var record = HomeRecord();

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
                   image: new DecorationImage(image: NetworkImage('https://yiqi-shenyang-test.oss-cn-beijing.aliyuncs.com/uploads/images/20191230/1d2b4b41baddd7cbbd85fab344e03fac.png'),fit: BoxFit.fill),
                   shape: BoxShape.rectangle,
                   borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(14))),
                ),
              ),
              left: W(27),
              top:  H(20),
              bottom: H(20),
              width: W(60),
            ),
            Positioned(
              left: W(100),
              top: H(12),
              child: Text(record.invites[index].title ,style: TextStyle(fontSize: 15,color: Colors.black)),
            ),
            Positioned(
              left: W(100),
              right: W(20),
              top: H(31),
              child: Text(record.invites[index].desc ,style: TextStyle(fontSize: 12,color: Colors.black45 ,),maxLines: 1, overflow: TextOverflow.visible,),
            ),
            Positioned(
              left: W(100),
              top: H(50),
              child: Text(record.invites[index].tags ,style: TextStyle(fontSize: 10,color: Colors.black45)),
            ),
            Positioned(
              left: W(100),
              bottom: H(15),
              child: Text('任务完成度：'+record.invites[index].current.toString() ,style: TextStyle(fontSize: 12,color: Colors.black45)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  initState(){
    _checkPersmission();
    Future.delayed(Duration(seconds: 1), (){
      getAppInitData();
    });
    super.initState();
  }

  @override
  dispose(){
    super.dispose();
  }

  Widget _topBgView(){
    return Stack(
      children: <Widget>[
        Container(
          width: ScreenUtil.screenWidth,
          height: H(465),
          color: Colors.white,
        ),
        Positioned(
          left: 0,
          right: 0,
          top: -1,
          height: H(238),
          child: new Image.asset("./images/Home/top_bg.png",fit: BoxFit.fill),
        ),
        Positioned(
          top: H(190),
          left: W(50),
          right: W(50),
          height: H(60),
          child: FlatButton(
            onPressed: ()=> print("object"),
            child: Image.asset("./images/Home/oil_onekey.png",fit: BoxFit.fill,),
            
          ),
        ),
        Positioned(
          left: W(19),
          height: H(30),
          width: W(200),
          top: H(265),
          child: Text("这里是1滚动信息发布",style: TextStyle(fontSize: 15,color: Colors.black87),),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: H(290),
          height: H(124),
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
          left: W(19),
          height: H(15),
          top: H(425),
          child: Image.asset("./images/Home/task_icon.png" ,fit: BoxFit.fill,),
        ),
        Positioned(
          child: Container(
            width: W(40),
            height: W(40),
            decoration: BoxDecoration(
              image: new DecorationImage(image: NetworkImage("https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=605585087,1627229068&fm=26&gp=0.jpg") ,fit: BoxFit.cover),
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
          ),
          left: W(19),
          top: H(30),
        ),
        Positioned(
          left: W(70),
          top: H(32),
          child: Text("沈阳市" ,style:TextStyle(fontSize:12, color: Colors.grey[300])),
          height: 20,
        ),
        Positioned(
          left: W(70),
          top: H(55),
          child: Text("奥体中心加油站 距您1.5KM" ,style:TextStyle(fontSize:11, color: Colors.grey[300])),
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
          left: W(50),
          top: H(85),
          width: 114,
          height: 22,
        ),
        Positioned(
          child: Image.asset("./images/Home/earnMoney.png"),
          right:W(50),
          top: H(85),
          width: 114,
          height: 22,
        ),
        Positioned(
          left: (screenWidth()/2-100)/2,
          top: H(107),
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
          left: (screenWidth()/2-100)/2+screenWidth()/2,
          top: H(107),
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
          left: W(35),
          top: H(152),
          width: 100,
          height: 20,
        ),
        Positioned(
          right: screenWidth()/2,
          top: H(150+(20-15)/2),
          height: H(15),
          child: Text("+230.21",style: TextStyle(color: Colors.white)),
        ),
        Positioned(
          child: Image.asset("./images/Home/taskEarn.png"),
          left: screenWidth()/2+W(20),
          top: H(150),
          width: 100,
          height: 20,
        ),
        Positioned(
          right: W(20),
          top: H(150+(20-15)/2),
          child: Text("+230.21",style: TextStyle(color: Colors.white),)
        ),
      ],
    );
  }

  void getAppInitData(){
    HttpUtil.instance.postData(appInit, {'':''}, RequestLisener(onSucessLisener: (BaseResponse rep){
      print(rep.data);
      getHomeInfo();
    },onFailLisener: (BaseResponse rep){
      print(rep.msg);
    }));
  }

  void getCouponlistData(){

  }

  void getHomeInfo() async{
    Map param = Map();
    param['city'] = ''; 
    param['position'] = '';
    HttpUtil.instance.postData(homeInfo, param, RequestLisener(onSucessLisener: (BaseResponse rep){      
      record = HomeRecord.fromJson(rep.data);
      print('数组个数'+record.invites.length.toString());
      print('首页数据请求成功');
      setState(() {
      });
    }, onFailLisener: (BaseResponse rep){
      Fluttertoast.showToast(msg: rep.msg);
    }));
  }

  void _checkPersmission() async{
    PermissionStatus permission =
    await PermissionHandler().checkPermissionStatus(PermissionGroup.location);
    if(permission == PermissionStatus.granted){
      AMapLocationClient.onLocationUpate.listen((AMapLocation loc) {
      if (!mounted) return;
      print(loc);
      setState(() {
      });
     });
      AMapLocationClient.startLocation();
    }else{
      print('没有权限');
      Fluttertoast.showToast(msg: '没有权限');
      // await PermissionHandler().openAppSettings();//打开应用设置
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Material(
      color: Colors.white,
      child: record != null ? CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _topBgView(),
          ),
          SliverFixedExtentList(
            itemExtent: H(100),
            delegate: SliverChildBuilderDelegate((BuildContext context, int index){
              return _listItem(context, index);
            },
            childCount: record.invites == null ? 0 : record.invites.length,
            ),
          ),
        ],
      )
      : Center(
        child: CircularProgressIndicator(),
      ),
    );

  }
}