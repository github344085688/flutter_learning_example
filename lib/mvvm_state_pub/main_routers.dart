import 'package:flutter/material.dart';
import 'package:flutter_learning_example/mainApp/routers/route_interface.dart';
import 'package:flutter_learning_example/mainApp/agency_route.dart';

import 'package:flutter_learning_example/mvvm_state_pub/stacked_pub/stacked_pub.dart';

const MvvmStatePub = <DefaultRoute>[
  DefaultRoute(
      groupName: "Stacked  state Pub",
      icon: Icon(Icons.extension),
      children: <DefaultRoute>[
        DefaultRoute(
            groupName: 'Stacked',
            icon: Icon(Icons.extension),
            routes: <AgencyRoute>[
              AgencyRoute(
                child: StackedPub(),
                icon: Icon(Icons.keyboard_arrow_right),
                sourceFilePath:
                'lib/mvvm_state_pub/stacked_pub/stacked_pub.dart',
                title: 'Provider Example',
                description: '状态管理',
                explain: '',)
            ]),
      ]),

];