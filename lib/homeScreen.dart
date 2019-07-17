import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('HomeScreen'),
//      ),
//      body: new Center(
//        child: new Text('Welcome to Home.!'),
//      ),
//
//    );
//  }



  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('HomeScreen'),
      ),
      body: Center(
        child: Container(
          height: 50,
          width: 200,
          child: Stack(
            children: <Widget>[

              Center(
                child: TextField(
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      hintText: 'city Name',
                    ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}