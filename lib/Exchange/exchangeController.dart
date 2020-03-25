import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';

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
      child: SectionTableView(
        sectionCount: 1, numOfRowInSection: (section){
          return 10;
        }, cellAtIndexPath: (section,row){
          return Container(

          );
        },headerInSection: (section){
          return Container(

          );
        },divider: Container(

        ),
        ),
    );
  }

  Widget _getListDate(BuildContext context, int position) {
    if (list != null) {
        return GestureDetector(
          onTap: () {
            Fluttertoast.showToast(msg: 'aaaaaa');
          },
          child: Center(
              child: new Container(
                  width: ScreenUtil().scaleWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(top: 2.0),
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Center(child: new Text(list[position])))),
        );
    }else{
      return null;
    }
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
}