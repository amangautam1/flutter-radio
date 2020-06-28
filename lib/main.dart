import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_radio/flutter_radio.dart';
import 'package:remotemusic/HomeScreen.dart';

void main() {
  runApp(new MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    title: "Radio",
    theme: ThemeData(backgroundColor: Color.fromRGBO(39, 139, 229, 100)),
  ));
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {

  var _androidAppRetain = MethodChannel("android_app_retain");
  @override
  void initState() {
    super.initState();    audioStart();

  }
  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
    print('Audio Start OK');
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (Platform.isAndroid) {
          if (Navigator.of(context).canPop()) {
            return Future.value(true);
          } else {
            _androidAppRetain.invokeMethod("sendToBackground");
            return Future.value(false);
          }
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Internet Radio"),
          leading: Icon(Icons.menu),
        ),
        body:HomeScreen(),
      //   
      )
    );
  }
}
