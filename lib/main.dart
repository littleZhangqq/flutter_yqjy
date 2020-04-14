import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_yqjy/Base/util.dart';
import 'Base/tabbarController.dart';
import 'package:flutter/services.dart';
import 'package:amap_location/amap_location.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AMapLocationClient.setApiKey('cf2599e32f7febca61963bd952aa1c72');
    EasyLoading.instance
    ..displayDuration = Duration(seconds: 2)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..textColor = Colors.white
    ..maskColor = Color.fromARGB(1, 0, 136, 255)
    ..indicatorColor = colorRGB(0, 136, 255);
    
    return FlutterEasyLoading(
      child: MaterialApp(
        home: TabbarController(),
      ),
    );
  }
}

