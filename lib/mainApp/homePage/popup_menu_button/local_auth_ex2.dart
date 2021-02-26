import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transparent_image/transparent_image.dart'
    show kTransparentImage;

class LocalAuthExamples extends StatefulWidget {
  const LocalAuthExamples({Key key}) : super(key: key);

  @override
  _LocalAuthExampleState createState() => _LocalAuthExampleState();
}

class _LocalAuthExampleState extends State<LocalAuthExamples> {
  var localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('指纹识别demo'),
        ),
        body: Container(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () async {
                  try {
                    bool canCheckBiometrics =
                    await localAuth.canCheckBiometrics;
                    print(canCheckBiometrics);
                  } catch (e) {
                    print(3);
                  }
                },
                child: Text('检测是否支持生物识别'),
              ),
              Divider(),
              RaisedButton(
                onPressed: () async {
                  try {
                    List<BiometricType> availableBiometrics =
                    await localAuth.getAvailableBiometrics();
                    print(availableBiometrics);
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text('获取支持的生物识别列表'),
              ),
              Divider(),
              RaisedButton(
                onPressed: () async {
                  bool canCheckBiometrics = await localAuth.canCheckBiometrics;
                  //下面是汉化
                  const andStrings = const AndroidAuthMessages(
                    cancelButton: '取消',
                    goToSettingsButton: '去设置',
                    fingerprintNotRecognized: '指纹识别失败',
                    goToSettingsDescription: '请设置指纹.',
                    fingerprintHint: '指纹',
                    fingerprintSuccess: '指纹识别成功',
                    signInTitle: '指纹验证',
                    fingerprintRequiredTitle: '请先录入指纹!',
                  );
                  print(canCheckBiometrics);
                  try {
                    bool didAuthenticate =
                    await localAuth.authenticateWithBiometrics(
                        localizedReason: '扫描指纹进行身份识别',
                        useErrorDialogs: false,
                        stickyAuth: true,
                        androidAuthStrings: andStrings);
                    print('didAuthenticate!!!!!!!!!!: $didAuthenticate');
                  } catch (e) {
                    if (e.code == 'NotEnrolled') {
                      Fluttertoast.showToast(
                          msg: '请先设置指纹', backgroundColor: Colors.grey);
                    }
                  }
                },
                child: Text('指纹识别s'),
              ),
              Divider(),
              // 是否开启指纹登录

            ],
          ),
        ));
  }

}

/*
MainActiviti

import io.flutter.embedding.android.FlutterFragmentActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterFragmentActivity {
  @Override
  public void configureFlutterEngine(FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
  }
}*/

// 在AndroidManifest.xml中增加USE_FINGERPRINT权限：

/*<manifest xmlns:android="http://schemas.android.com/apk/res/android"
package="com.mlkui.flutter.example">
<!-- Flutter needs it to communicate with the running application
to allow setting breakpoints, to provide hot reload, etc.
-->
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.USE_FINGERPRINT"/>
</manifest>*/
