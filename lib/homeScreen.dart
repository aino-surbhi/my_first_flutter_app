import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {

    final field = TextField(

    //  obscureText: false,
      style: style,
      decoration: InputDecoration(

        //  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "City Name",
          icon: new Icon(Icons.gps_fixed),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),

    );






    final searchButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
      //  minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Search",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );


    return Scaffold(
            appBar: AppBar(
        centerTitle: true,
        title: Text('Home Page'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                SizedBox(height: 15.0),

                field,
                SizedBox(height: 15.0),

                searchButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),

        ),
      ),
    );
  }
}