import 'package:classmate_connect/Routes/Home.dart';
import 'package:classmate_connect/Routes/Questions.dart';
import 'package:classmate_connect/Routes/Users.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Users(), // becomes the route named '/'
    routes: <String, WidgetBuilder>{
      '/Home': (BuildContext context) => Home(),
      '/Users': (BuildContext context) => Users(),
    },
    title: "Classmate Connector",
    theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity),
    debugShowCheckedModeBanner: false,
  ));
}
