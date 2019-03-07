// This is the entry point for our application
import "package:flutter/material.dart";
import "dashboard/dashboard.dart";

void main() => runApp( new MyApp());

class MyApp extends StatelessWidget {

  //This widget is the root of the application

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'K-Dharura',
      theme: new ThemeData(

        primarySwatch: Colors.grey,

      ),

      home: Dashboard(),
    );
  }
}