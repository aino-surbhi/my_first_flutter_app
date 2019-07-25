import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/homeScreen.dart';

import 'all_translations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  await allTranslations.init();
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new Home()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String textValue;

  FirebaseMessaging firebaseMessaging=new FirebaseMessaging();
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
    firebaseMessaging.configure(

      onLaunch: (Map<String, dynamic> msg) {
        print("on launched called");
      },
      onResume: (Map<String, dynamic> msg) {
        print("on resumed called");
      },
      onMessage: (Map<String, dynamic> msg) {
        print("onMessage called");
      },
    );

    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(

            sound: true,
            alert: true,
            badge: true


        )
    );

    firebaseMessaging.onIosSettingsRegistered.listen((
        IosNotificationSettings setting) {
      print("Ios setting registered");
    });

    firebaseMessaging.getToken().then((token) {
      update(token);
    });
  }
    update(String token){
    print(token);
    textValue =token;
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: 1000,
          width: 1000,
          child: Stack(
            children: <Widget>[
              Center(
                child: new Image.asset(
                  'images/splashscreen.png',
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Text("Discover Your City!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                        color: Colors.white)

                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}


