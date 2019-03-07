import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override

  _DashboardState createState() => _DashboardState();

  
}

class _DashboardState extends State<Dashboard>{

  @override
  Widget build(BuildContext context){

    return Scaffold(
    appBar: AppBar(
      title: Text("K-Dharura"),
      elevation: .1,
      backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
    ),
  body: Container(
    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
    child: GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(3.0),
      children: <Widget>[
        makeDashboardItem("emergency Contacts", Icons.folder),
        makeDashboardItem("Personal Details", Icons.account_circle),
        makeDashboardItem("Fire Emergency", Icons.train),
        makeDashboardItem("Accident", Icons.flare),
        makeDashboardItem("Emergency Trigger", Icons.phone_iphone),
        makeDashboardItem("Maps", Icons.map)


      ],
    ),
  ),
    );

  
  }
  

}



//Creating a function that will take two arguments a title and an icon


Card makeDashboardItem(String title, IconData icon){

  return Card(
    elevation: 1.0,
    margin: new EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
      child: new InkWell(
        onTap: (){},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          verticalDirection: VerticalDirection.down,

          children: <Widget>[
            SizedBox(height: 50.0),
            Center(
              child: Icon(
                icon,
                size: 40.0,
                color: Colors.black,

              ),
            ),
              
            SizedBox(height: 20.0,),
            new Center(
              child: new Text(title, style: new TextStyle(fontSize: 18.0, color: Colors.black)),
            )


          ],
        ),

      ),
    ),
  
  
  );

}