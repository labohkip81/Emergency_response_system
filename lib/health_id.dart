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
             padding: EdgeInsets.only(left: 130,right: 130),
             child: Text('Profile Picture'),

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
             child: ClipOval(child:Icon(Icons.account_circle),),
           ),
           SizedBox(height: 20.0,),
           Container(
             padding: EdgeInsets.all(20.0),
             child: Text('Fill the fields below'),
           ),
           Container(
             padding: EdgeInsets.all(20.0),
             child: TextFormField(decoration: InputDecoration(
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
               hintText: 'A, B, AB, 0',
               labelText: 'Blood Group',
               labelStyle: TextStyle(
                 fontSize: 15.0,
                 fontWeight: FontWeight.bold,
               ),
             ),),
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


 