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
          
          child:Column(
            
         children: <Widget>[
           Padding(padding: EdgeInsets.only(top: 50.0),),
           Container(
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
           
         ],
            
          )),
      ),
      
      
    );
  }
}


 