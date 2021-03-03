import 'package:flutter/material.dart';
import 'package:flutter_learning_example/mainApp/my_main_app.dart';
import 'package:amap_location/amap_location.dart';
import 'dart:io';
import 'package:flutter/services.dart';
void main(){
  if(Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
  //Flutter 设置状态栏透明
  AMapLocationClient.setApiKey("1052b827e4de740c08f6ce3f8266fdc4");
  return runApp(MyMainApp());

}

