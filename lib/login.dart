import 'package:flutter/material.dart';
import './main.dart';

void main() => runApp(FirstRoute());

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'K-Dharura',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Stack(
              alignment: Alignment.center,
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.only(right: 50.0, top: 50.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      color: Colors.green),
                  child: new Icon(
                    Icons.local_cafe,
                    color: Colors.white,
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.only(left: 10.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      color: Colors.blue),
                  child: new Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.only(
                    left: 50.0,
                    top: 50.0,
                  ),
                  height: 60.0,
                  width: 60.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      color: Colors.orange),
                  child: new Icon(
                    Icons.local_car_wash,
                    color: Colors.white,
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.only(
                    left: 130.0,
                    top: 50.0,
                  ),
                  height: 60.0,
                  width: 60.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(50.0),
                      color: Colors.cyan),
                  child: new Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(top: 150.0),
                      child: Text(
                        'Kempiski',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right:60.0,left: 60.0,top: 60.0),
                    child: new Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.green,borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Text('Sign in With Email' ,style:new TextStyle(fontSize: 20.0,)),
                    ),
                  ),
                )
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 5.0,top: 20.0),
                    child: new Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Text('Facebook' ,style:new TextStyle(fontSize: 20.0,)),
                    ),
                  ),
                ),
                     Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 20.0,top: 20.0),
                    child: new Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.orange,borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Text('Google' ,style:new TextStyle(fontSize: 20.0,)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}