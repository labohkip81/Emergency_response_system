import 'package:flutter/material.dart';

import 'dart:async';
import 'package:sqflite/sqflite.dart';



void main() => runApp(new HealthDetails());


class HealthDetails extends StatefulWidget {
  @override
  _HealthDetailsState createState() => _HealthDetailsState ();
}

class _HealthDetailsState extends State<HealthDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon:Icon(Icons.arrow_back),
            onPressed: (){Navigator.pop(context);},),
          title: Text('Health ID',),
          actions: <Widget>[
            RaisedButton(
              color: Colors.blue,
              onPressed: (){},
              child: Text('SAVE'),
            ),
             ],
        ),
        body: Center(
          
          child:ListView(
            
         children: <Widget>[
           Padding(padding: EdgeInsets.only(top: 30.0),),
           Container(
             padding: EdgeInsets.only(left: 150,right: 150),
             child: Text('Laban Kiplagat'),

           ),
           SizedBox(height: 20.0),
           
             

           Container(
             
             height: 100,
             width: 100,
             decoration:BoxDecoration(
               border: Border.all(
                 
                 color: Colors.blue,
                 width: 3.0
               ),
               gradient: LinearGradient(
                 colors: [
                   Colors.transparent,
                   Colors.blue[100],
                 ]
      
               ),
               shape: BoxShape.circle
               
             ),
             child: CircleAvatar(
               
               backgroundColor: Colors.white,
               radius: 48.0,
               child: Image.asset(
                 'assets/dev.png',
                 width:50.0,
                 height:50.0,
                 fit:BoxFit.cover
               ),
             ),
           
           ),
           
           SizedBox(height: 20.0,),
           Container(
             padding: EdgeInsets.all(20.0),
             child: Text('Personal Health'),
           ),
           Container(
             padding: EdgeInsets.all(20.0),

             child: Text(
               "Bloodgroup",
             ),
            //  child: TextFormField(decoration: InputDecoration(
            //    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            //    hintText: 'A, B, AB, 0',
            //    labelText: 'Blood Group',
            //    labelStyle: TextStyle(
            //      fontSize: 15.0,
            //      fontWeight: FontWeight.bold,
            //    ),
            //  ),),
           ),
           Container(
             padding: EdgeInsets.all(20.0),
             child: TextFormField(
               style: Theme.of(context).textTheme.title,
               decoration: InputDecoration(
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                 labelText: 'Health Complications',
                 hintText: 'e.g Liver disease, Diabetes ',
                 labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)
             ),),
           ),
           Container(
             padding: EdgeInsets.all(20.0),
             child: TextFormField(
               decoration: InputDecoration(
                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                 labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                 labelText: 'Doctor`s note',
                 hintText: 'What should be done when you in a certain condition',
               ),
             ),
           )
           
         ],
            
          )),
      ),
      
      
    );
  }
}




