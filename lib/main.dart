import 'model/lesson.dart';
import 'package:flutter/material.dart';
import 'detail_page.dart';
import './main2.dart';
import './menu.dart';
import 'package:share/share.dart';
import './send_sms.dart';
//The import below handles opening a new page webpage within the app


//This package is used to load external urls
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'K-Dharura App',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
      home: new ListPage(title: 'K-Dharura'),
      // home: DetailPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {


  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



   
    ListTile makeListTile(Lesson lesson) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
           

            child:
             Icon(Icons.near_me, color: Colors.white),
             
  
           
          ),

         
          title: Text(
          lesson.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                        value: lesson.indicatorValue,
                        valueColor: AlwaysStoppedAnimation(Colors.green)),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(lesson.level,
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
           
          //This if Statement determines what happens when the button/ card is clicked


            if(lesson.type=="ambulance"){
              //The call me function has been defined below the main. dart file
              _callMe();
              _textMe();
            
              print(" Hey there you're calling an ambulance");
            }
            else 
            if(lesson.type=="Fire"){
              _launchURL();
            }
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DetailPage(lesson: lesson)));
          },
        );



//This defines the contents to be passed to the cardView Button.




ListTile ambulanceTile() => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
           

            child:
             Icon(Icons.blur_on, color: Colors.white),
             
  
           
          ),

         
          title: Text(
          "Ambulance Call",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation(Colors.green)),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Request for an ambulance",
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.phone, color: Colors.white, size: 30.0),
          onTap: () {
           
          //This if Statement determines what happens when the button/ card is clicked


           
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DetailPage(lesson: lesson)));
          },
        );

//This defines the content to be passed to the fire button





ListTile fireTile() => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
           

            child:
             Icon(Icons.local_car_wash, color: Colors.white),
             
  
           
          ),

         
          title: Text(
          "Fire emergency",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation(Colors.red)),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Request for a fire fighter",
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.phone, color: Colors.white, size: 30.0),
          onTap: () {
           
          //This if Statement determines what happens when the button/ card is clicked


           
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DetailPage(lesson: lesson)));
          },
        );

  //This ListTile defines what happens when the Police cardView is clicked

  ListTile policeTile() => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
           

            child:
             Icon(Icons.lightbulb_outline, color: Colors.white),
             
  
           
          ),

         
          title: Text(
          "Police Emergency",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation(Colors.orange)),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Alert the police",
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.phone, color: Colors.white, size: 30.0),
          onTap: () {
           
          //This if Statement determines what happens when the button/ card is clicked


           
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DetailPage(lesson: lesson)));
          },
        );


//This holds the car Accident Button which alerts both the police and hospitals and people in the sorrounding.

ListTile accidentTile() => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
           

            child:
             Icon(Icons.beenhere, color: Colors.white),
             
  
           
          ),

         
          title: Text(
          "Accident",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation(Colors.red)),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Report an accident",
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.email, color: Colors.white, size: 30.0),
          onTap: () {
           
          //This if Statement determines what happens when the button/ card is clicked


           
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DetailPage(lesson: lesson)));
          },
        );

//This ListTile holds contents for the Health-Card


ListTile healthListTile() => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
           

            child:
             Icon(Icons.supervisor_account, color: Colors.white, size: 40.0,),
             
  
           
          ),

         
          title: Text(
          "Health ID",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
    
                
                  
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: Text("View Personal Health information",
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.account_circle, color: Colors.white, size: 30.0),
          onTap: () {
           
          //This if Statement determines what happens when the button/ card is clicked


           
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DetailPage(lesson: lesson)));
          },
        );




//This ListTile defines the contents to be held by the message Card

ListTile panicListTile() => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
           

            child:
             Icon(Icons.transfer_within_a_station, color: Colors.white),
             
  
           
          ),

         
          title: Text(
          "Panic Button",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: Text("This button automatically sends a message to your close patners so they can take action.",
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.arrow_forward, color: Colors.white, size: 30.0),
          onTap: () {
           
          //This if Statement determines what happens when the button/ card is clicked


           
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DetailPage(lesson: lesson)));
          },
        );


//This listTile holds the content to be displayed by the Car Break-Down card

ListTile breakDownTile() => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
           

            child:
             Icon(Icons.traffic, color: Colors.redAccent, size: 30.0,),
             
  
           
          ),

         
          title: Text(
          "Break Down Services",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
             
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: Text("Request for Car Breakdown Service",
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.traffic, color: Colors.greenAccent, size: 30.0),
          onTap: () {
           
          //This if Statement determines what happens when the button/ card is clicked


           
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DetailPage(lesson: lesson)));
          },
        );




//This listTile defines the contents to be held in the Panic buttonCardView.


ListTile firstAidListTile() => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
           

            child:
             Icon(Icons.nature_people, color: Colors.white,size: 30.0,),
             
  
           
          ),

         
          title: Text(
          "First Aid Procedures",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
             
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: Text("List Common First Aid procedures",
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
           
          //This if Statement determines what happens when the button/ card is clicked


           
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DetailPage(lesson: lesson)));
          },
        );





//This button Will carry the about us info to the cardView.

ListTile aboutUSListTile() => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
           

            child:
             Icon(Icons.people_outline, color: Colors.white, size: 30.0,),
             
  
           
          ),

         
          title: Text(
          "About K-Dharura Team",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
             
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: Text("Read more Information About K-Hub",
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
           
          //This if Statement determines what happens when the button/ card is clicked


           
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DetailPage(lesson: lesson)));
          },
        );




    Card makeCard(Lesson lesson) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(lesson),
          ),
        );

//this is the ambulance cardView displayed on the homescreen
    Card ambulanceCard() => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: ambulanceTile(),
          ),
        );


//This is the fire CardView 


    Card fireCard() => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: fireTile(),
          ),
        );

//This is the Police CardView

     Card policeCard() => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: policeTile(),
          ),
        );

//This is the Accident CardView

Card accidentCard() => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: accidentTile(),
          ),
        );


//This is the healthID Card
       Card healthCard() => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: healthListTile(),
          ),
        );



//This is the messageCard when pressed initializes a message sending function


    Card panicCard() => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: panicListTile(),
          ),
        );





//This is the Panic Button CardView

 Card breakDownCard() => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: breakDownTile(),
          ),
        );


//This is the firstAid Button CardView

Card firstAidCard() => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: firstAidListTile(),
          ),
        );



//This is the About us Button CardView

Card aboutUSCard() => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: aboutUSListTile(),
          ),
        );






  //This was a makebody function that passed a list view but it was not implemented.



  //.............................................................................................................
    // final makeBody = Container(
    //   // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
    //   child: 
      
      
      
    //   ListView.builder(
    //     scrollDirection: Axis.vertical,
    //     shrinkWrap: true,
    //     itemCount: lessons.length,
    //     itemBuilder: (BuildContext context, int index) {
          
    //       return Column(
    //         children: <Widget>[
    //           healthCard(),
    //           policeCard()
    //         ],
    //       );
          
    //     },
    //   ),
    // );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        // color: Color.fromRGBO(58, 66, 86, 1.0),
        color: Colors.blueGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.camera_alt, color: Colors.white,),
              onPressed: () {
                _launchURL();
              },
            ),
            IconButton(
              icon: Icon(Icons.location_on, color: Colors.green),
              onPressed: () {
              _callMe();
              },
            ),
            IconButton(
              icon: Icon(Icons.message, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: choiceAction ,
          itemBuilder: (BuildContext context){
            return Constant.choices.map((String choice){
              return PopupMenuItem<String>(
                value:choice,
                 
                child: Text(choice),
              );

            }).toList();
          }
          
        )
      ],
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: ListView(
        children: <Widget>[
         ambulanceCard(),
         fireCard(),
         policeCard(),
         accidentCard(),
         healthCard(),
         panicCard(),
         breakDownCard(),
         firstAidCard(),
         aboutUSCard(),
         

         

        ],
      ),
      
   
      bottomNavigationBar: makeBottom,
    );
  }
}

List getLessons() {

  return [
    Lesson(
        title: "Ambulance Emergency Call",
        level: "Health",
        type: "ambulance",
        indicatorValue: 0.33,
        price: 20,
        
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Report fire Ocurence",
        level: "Critical",
        type: "Fire",
        indicatorValue: 0.33,
        price: 50,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Call Police",
        level: "Intermidiate",
        indicatorValue: 0.66,
        price: 30,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Reversing around the corner",
        level: "Intermidiate",
        indicatorValue: 0.66,
        price: 30,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Incorrect Use of Signal",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 50,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Engine Challenges",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 50,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Self Driving Car",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 50,
        content:
            "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.  ")
  ];
}
// to implement functionality fo popup menu
void choiceAction(String choice){
  if(choice ==Constant.Settings){
    // code when buttons clicked to open another activity
    Share.share('Text');}
  else if(choice == Constant.Account){
   

  }
  else if(choice==Constant.Share){
    Share.share("www.github.com/labohkip81/Emergency_response_system.git kindly visit to contribute");

  }
  else{
    
    _launchURL();
  

 

  }

   

}


//This functionality opens an external url link.

_launchURL() async {
  const url = 'https://www.google.com/maps/search/?api=1&query=Hospitals';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}



//This code opens phone and passes a phone number parameter when clicked.
_callMe() async {
    // Android
    const uri = 'tel:+1 222 060 888';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      const uri = 'tel:001-22-060-888';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }
  
  //This code automatically sends sms to the user

_textMe() async {
    // Android
    const uri = 'sms:+39 349 060 888';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      const uri = 'sms:0039-222-060-888';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }




//This function opens google maps



//Google Map Functionality with string Passed.


 _Amap() async {
    const googleUrl = 'https://www.google.com/maps/search/?api=1&query=Hospitals';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
