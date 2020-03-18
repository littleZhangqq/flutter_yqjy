import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 设置宽度 按照设计图尺寸是iPhone6的宽度为固定参照，当前控件在设计图所占的宽度比例，乘以当前
double W(double width){
    double compare = width/375.0;
    return (ScreenUtil.screenWidth/ScreenUtil.pixelRatio) * compare;
  }
///设置高度 按照设计图尺寸是iPhone6的宽度为固定参照，当前屏幕宽度除以iPhone6屏幕宽度是当前设备的宽度比，在这款设备上宽度已经放大或缩小了这个比例，高度也要保持这个宽高比  否则会出现宽高比不一致的问题
double H(double height){
    return height *((ScreenUtil.screenWidth/ScreenUtil.pixelRatio)/375.0);
  }

