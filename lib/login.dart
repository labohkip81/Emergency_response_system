import 'package:flutter/material.dart';

void main() => runApp(new Login());


class  Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home:new MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

    );
  }
}