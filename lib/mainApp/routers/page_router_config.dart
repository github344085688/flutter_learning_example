
import 'package:flutter_learning_example/mainApp/routers/route_interface.dart';

import 'package:flutter_learning_example/dart/main_routers.dart';
import 'package:flutter_learning_example/based_component/main_routers.dart';
import 'package:flutter_learning_example/layouts_or_widget/main_routers.dart';
import 'package:flutter_learning_example/flutter_apply/main_routers.dart';
import 'package:flutter_learning_example/flutter_widget/main_routers.dart';
import 'package:flutter_learning_example/flutter_pub/main_routers.dart';
import 'package:flutter_learning_example/http/main_routers.dart';
import 'package:flutter_learning_example/navigator/main_routers.dart';
import 'package:flutter_learning_example/share_communication/main_routers.dart';
import 'package:flutter_learning_example/lifecycle/main_routers.dart';
import 'package:flutter_learning_example/mvvm_state_pub/main_routers.dart';

const MyDefaultRoutes = <DefaultRoute>[
  ...dartGrammar,
  ...basedComponent,
  ...layoutRouter,
  ...flutterApply,
  ...flutterWidget,
  ...flutterPub,
  ...flutterHttp,
  ...navigator,
  ...shareCommunication,
  ...lifecycle,
  ...MvvmStatePub
];
