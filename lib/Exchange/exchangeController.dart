import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_yqjy/Base/Util.dart';

class ExchangeController extends StatefulWidget {
  @override
  _ExchangeControllerState createState() => _ExchangeControllerState();
}

class _ExchangeControllerState extends State<ExchangeController> {
  var list = List();
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
                itemCount: 3,
                itemBuilder: (BuildContext context,int index) {
                  return new Image.network("https://yiqi-shenyang-test.oss-cn-beijing.aliyuncs.com/uploads/images/20190527/c9e6b16f749faf104f5ba7b3a85f5845.png" ,fit:BoxFit.fill);
                },
                pagination: SwiperPagination(margin: EdgeInsets.only(bottom: H(10))),
                autoplay: true,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: H(18),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((BuildContext context,int index) {
              return _item(index);
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 22,
              mainAxisSpacing: 0,
              crossAxisSpacing: W(17),
              childAspectRatio: 0.7
              ),
          ),
        ],
      ),
    );
  }

  _getdata() async {
    Future.delayed(Duration(seconds: 1),(){
      for (var i = 0; i<5; i++) {
        list.add('json');
      }
      //更新视图.
    setState(() {});
    }); 
   }

   @override
  void initState() {
    _getdata();
    super.initState();
  }

  @override
  dispose(){
    super.dispose();
  }

  Widget _item(int index){
    return Container(
      color: Colors.white,
      child: FlatButton(
        onPressed: ()=>print('点击了商品列表'),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                height: W(160),
                width: W(160),
                color: Color.fromRGBO(227, 227, 227, 1),
                child: FadeInImage.assetNetwork(
                  placeholder: 'Image',
                  image: 'https://www.yiqijiayou00598.com//uploads/images/20190819/e0a392521fc596fdb238a58e25007dad.jpg',
                ),
              ),
              left: index%2 == 0 ? W(17) : W(9),
              right: index%2 == 0 ? W(9) : W(17),
              top: 0,
              height: H(200),
            ),
            
          ],
        ),
      ),
    );
  }
}