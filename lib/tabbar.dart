import 'package:flutter/material.dart';


class TabBarApp extends StatelessWidget {

  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      title: "MySampleApplication",

        home: new DefaultTabController(
               length: 2,
              child: new Scaffold(
                  appBar: new AppBar(
                     title: new Text("Tab Bar View"),
                      backgroundColor: Colors.orange,
                     bottom: new TabBar(tabs: <Widget>[
                        new Tab(text: "First Tab"),
                       new Tab(text: "Second Tab"),

       ],
       ),
       ),
                  body: new TabBarView(
                      children: <Widget>[
                        new Text("You've Selected First"),
                        new Text("You've Selected Second"),
                      ]
                  )
      ),
     )

    );
  }
}