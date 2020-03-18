import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExchangeController extends StatefulWidget {
  @override
  _ExchangeControllerState createState() => _ExchangeControllerState();
}

class _ExchangeControllerState extends State<ExchangeController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Container(
      color: Colors.orange,
    );
  }
}