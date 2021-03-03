import 'package:flutter/material.dart';
import 'package:flutter_learning_example/mainApp/routers/root_app_routing_table.dart'
    show rootAppRoutingTable;
import 'package:provider/provider.dart';
import 'package:flutter_learning_example/flutter_pub/provider/counter.dart';
import 'package:flutter_learning_example/mainApp/routers/my_routers.dart'
    show homeRoute;
import 'package:permission_handler/permission_handler.dart';

final List<Permission> needPermissionList = [
  Permission.location,
  Permission.storage,
  Permission.phone,
  Permission.camera,
];

class MyMainApp extends StatelessWidget {
  const MyMainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Counter(1))],
      child: MyMainAppState());
}

class MyMainAppState extends StatefulWidget {
  MyMainAppState({Key key}) : super(key: key);

  @override
  _MyMainAppState createState() => _MyMainAppState();
}

class _MyMainAppState extends State<MyMainAppState> {
  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  @override
  void reassemble() {
    super.reassemble();
    _checkPermissions();
  }

  void _checkPermissions() async {
    Map<Permission, PermissionStatus> statuses =
        await needPermissionList.request();
    statuses.forEach((key, value) {
      print('$key ============--------------------- is $value');
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'My Main App Flutter',
        home: homeRoute.child,
        // Navigator.defaultRouteName: (context) => homeRoute,
        onGenerateRoute: onGenerateRoute,
      );
}

//Navigator.pushNamed 调用（在router跳转时候调用发生。）
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  //outer跳转时候匹配Widget,
  final Function pageContentBuilder = rootAppRoutingTable[name];
  print('========${settings.arguments}');
  print('--------${settings.name}');
  print('+++++++++${rootAppRoutingTable[name]}');
  if (pageContentBuilder != null) {
    //在router跳转时候处理arguments
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) {
          //将RouteSettings中的arguments参数取出来，通过构造函数传入
          return pageContentBuilder(context, arguments: settings.arguments);
        },
        settings: settings,
      );
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
