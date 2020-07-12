import 'package:classmate_connector/Routes/Home.dart';
import 'package:classmate_connector/Routes/Questions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Questions(), // becomes the route named '/'
    routes: <String, WidgetBuilder>{
      '/Home': (BuildContext context) => Home(),
    },
    title: "Classmate Connector",
    theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity),
    debugShowCheckedModeBanner: false,
  ));
}
