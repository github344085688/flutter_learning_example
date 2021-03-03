import 'package:flutter/material.dart';
import 'package:amap_location/amap_location.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key key}) : super(key: key);
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  double _longitude = 0;
  double _latitude = 0;

  @override
  void initState() {
    super.initState();
    // 获取地理定位
    this._getLocation();
  }

  void _getLocation() async {

    // 启动一下
    await AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters
    ));

    // 获取地理位置
    var result = await AMapLocationClient.getLocation(true);
    setState(() {
      this._longitude = result.longitude;
      this._latitude = result.latitude;
      print(_longitude);
      print(_latitude);
    });

  }

  // 监听地理位置
  // void _listenLocation(){
  //     AMapLocationClient.onLocationUpate.listen((AMapLocation loc){
  //         if(!mounted)return;
  //         setState(() {

  //         });
  //     });
  //     AMapLocationClient.startLocation();
  // }

  // // 停止监听地理位置
  // void _stopListenLocation(){
  //     AMapLocationClient.stopLocation();
  // }

  @override
  void dispose() {
    // 关闭
    AMapLocationClient.shutdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("地理定位"),
        ),
        body: Center(
            child:Column(
              children: <Widget>[
                Text("经度:${this._longitude}"),
                Text("纬度:${this._latitude}"),
              ],
            )
        )
    );
  }
}