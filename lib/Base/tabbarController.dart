import 'package:flutter/material.dart';
import 'package:flutter_yqjy/Home/homeController.dart';
import 'package:flutter_yqjy/Gas/gasController.dart';
import 'package:flutter_yqjy/Exchange/exchangeController.dart';
import 'package:flutter_yqjy/Mine/mineController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabbarController extends StatefulWidget {
  @override
  _TabbarControllerState createState() => _TabbarControllerState();
}

class _TabbarControllerState extends State<TabbarController> {

  var _selectIndex = 0;
  var viewControllers = [
    HomeController(),
    GasController(),
    ExchangeController(),
    MineController()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    ScreenUtil.init(context);
  
    return Scaffold(
      body: Center(
        child: viewControllers.elementAt(_selectIndex),
      ),
      bottomNavigationBar: tabbar(),
    );
  }

  Widget tabbar(){
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset("./images/unselect_home.png",width: 25,height: 25),
          activeIcon: Image.asset("./images/select_home.png",width: 25,height: 25),
          title: Text("首页"),
          // icon: Icon(Icons.chat)
        ),
        BottomNavigationBarItem(
          icon: Image.asset("./images/unselect_oil.png",width: 25,height: 25), 
          activeIcon: Image.asset("./images/select_oil.png",width: 25,height: 25),
          title: Text("加油"),
          // icon: Icon(Icons.chat)
        ),
        BottomNavigationBarItem(
          icon: Image.asset("./images/unselect_jifen.png",width: 25,height: 25),
          activeIcon: Image.asset("./images/select_jifen.png",width: 25,height: 25),
          title: Text("易兑"),
          // icon: Icon(Icons.chat)
        ),
        BottomNavigationBarItem(
          activeIcon: Image.asset("./images/select_mine.png",width: 25,height: 25),
          icon: Image.asset("./images/unselect_jifen.png",width: 25,height: 25,),
          title: Text("我的"),
          // icon: Icon(Icons.chat)
        )
      ],
      currentIndex: _selectIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.deepPurple,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: itemClick,
    );
  }

  void itemClick(int index){
    setState(() {
      _selectIndex = index;
    });
  }
}
