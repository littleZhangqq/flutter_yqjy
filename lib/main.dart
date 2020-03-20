import 'package:flutter/material.dart';
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
    return MaterialApp(
      home: TabbarController(),
      // theme: ThemeData.dark(),
    );
  }
}

