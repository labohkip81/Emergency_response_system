import 'package:flutter/material.dart';


void main() => runApp(new HealthId());


class HealthId extends StatefulWidget {
  @override
  _HealthIdState createState() => _HealthIdState();
}

class _HealthIdState extends State<HealthId> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon:Icon(Icons.arrow_back),
            onPressed: (){Navigator.pop(context);},),
          title: Text('Health ID',),
          actions: <Widget>[
            IconButton(
              icon:new Icon(Icons.save),
              onPressed: (){},)
          ],
        ),
        body: Center(
          child:Container(
            color: Colors.blueAccent,
          )),
      ),
      
      
    );
  }
}


 