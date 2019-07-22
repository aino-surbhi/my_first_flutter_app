import 'dart:async';
import 'dart:convert';
import 'package:my_first_flutter_app/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response =
  await http.get('https://my-json-server.typicode.com/aino-surbhi/demo-1/posts/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {

  final int id;
  final String title;


  Post({this.id, this.title,});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(

      id: json['id'],
      title: json['title'],

    );
  }
}




//void main() => runApp(ExchangeData(post: fetchPost()));

class ExchangeData extends StatelessWidget {
  final Future<Post> post;

  ExchangeData({Key key, this.post}) : super(key: key);

  void navigationPage(){

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(

          tooltip: 'Increment',
          child: Icon(Icons.add),
          backgroundColor: Colors.orange,
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => TabBarApp(),
                ))
        ),
      ),
    );
  }
}





class Photo {
  final String title;
  final String thumbnailUrl;

  Photo._({this.title, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return new Photo._(
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}