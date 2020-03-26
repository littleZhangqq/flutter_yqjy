import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_yqjy/Base/HttpUtil.dart';
import 'package:flutter_yqjy/Base/RequestSufix.dart';
import 'package:flutter_yqjy/Base/Util.dart';
import 'package:flutter_yqjy/Exchange/Model/ExchangeRecord.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ExchangeController extends StatefulWidget {
  @override
  _ExchangeControllerState createState() => _ExchangeControllerState();
}

class _ExchangeControllerState extends State<ExchangeController> {
  var list = List();
  ExchangeRecord record;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('我的易币'),
            expandedHeight: H(375),
            flexibleSpace: FlexibleSpaceBar(
              background: Swiper(
                itemCount: record.banners.length,
                itemBuilder: (BuildContext context,int index) {
                  return new Image.network(imageHost+ record.banners[index].path ,fit:BoxFit.fill);
                },
                pagination: SwiperPagination(margin: EdgeInsets.only(bottom: H(10))),
                autoplay: true,
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
            children: record == null ? list.map((e) => getItemContainer(e)).toList() : record.products.map((pro) => _item(pro)).toList(),
          ),
          
        ],
      ),
    );
  }

  Widget getItemContainer(String item) {
    return Container(
      width: 5.0,
      height: 5.0,
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.blue,
    );
  }

  _getdata() async {
    HttpUtil.instance.postData(exchange, {'tags':''}, RequestLisener(onSucessLisener: (BaseResponse rep){
      record = ExchangeRecord.fromJson(rep.data);
      setState(() {});
    }, onFailLisener: (String msg){
      Fluttertoast.showToast(msg: msg);
    }));
   }

   @override
  void initState() {
    _getdata();
     for (var i = 0; i<15; i++) {
        list.add('json');
      }
    super.initState();
  }

  @override
  dispose(){
    super.dispose();
  }

  Widget _item(Products item){
    return Container(
      color: Colors.white70,
      child: FlatButton(
        onPressed: ()=>print('点击了商品列表'),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                // color: Color.fromRGBO(200, 200, 200, 1),
              ),
              left: 0,
              right: 0,
              top: 20,
              bottom: 60,
            ),
            Positioned(
              child: new CachedNetworkImage(
                 placeholder: (context, url) => new CircularProgressIndicator(),
                 imageUrl: imageHost+item.thumb,
                 height: H(160),
                 width: W(160),
                 fit: BoxFit.fitWidth,
                 ),
              top: 20,
            ),
            Positioned(
              top: H(190),
              left:0,
              right: 0,
              child: Text(item.name,textAlign: TextAlign.center, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color.fromRGBO(102, 102, 102, 1),),),
            ),
            Positioned(
              top: H(210),
              left:0,
              right:0,
              child: Text('${item.coin}易币', textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.red,)),
            ),
          ],
        ),
      ),
    );
  }
}