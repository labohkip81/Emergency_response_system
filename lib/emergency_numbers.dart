import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {

  String appBarTitle;
  NoteDetail(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState(this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {

static var _properties = ['High','Low'];

String appBarTitle;

//Define text editing controller
TextEditingController titleController =TextEditingController();
TextEditingController descriptionController =TextEditingController();

NoteDetailState(this.appBarTitle);

@override
Widget build(BuildContext context) {

  //defining the text style within the build function

  TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build

    //The willpopscope widget controls what happens when the back button is clicked by the user.
    return WillPopScope(

    onWillPop: (){
      //this function carries the action that will be passed when the user presses the back button of the application
       moveToLastScreen();
    },

      child:
    Scaffold(
      appBar:AppBar(
        title:Text(appBarTitle),

        //Taking control of the back button on the top appbar.....navigating to other screens
        leading: IconButton(icon: Icon(
          Icons.arrow_back_ios),
          onPressed: (){
      //this function carries the action that will be passed when the user presses the back button of the application

            moveToLastScreen();
          },
        ),
      ),
      body: Padding(
        padding:EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            //first element
            ListTile(
              title: DropdownButton(
                //The items are defined as priorities list.
                items: _properties.map((String dropDownStringItem){

                  return DropdownMenuItem<String>(
                   value: dropDownStringItem,
                   child: Text(dropDownStringItem),
                  );
                }
                ).toList(),

                style: textStyle,

                //Default value for the dropdown

                value: 'Low',
                
                 onChanged: (valueSelectedByUser){
                   setState(() {
                     debugPrint('User selected $valueSelectedByUser');
                   });
                 }
              ),


            ),



//Defines the card to hold the emergency number for national Gbv
            Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: 
ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
           

            child:
             Icon(Icons.phone, color: Colors.white, size: 40.0,),
             
  
           
          ),

         
          title: Text(
          "National GBV",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
    
                
                  
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 0.0),
                    child: Text("1195",
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          // trailing:
          //     Icon(Icons.account_circle, color: Colors.white, size: 30.0),
          onTap: () {
            
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DetailPage(lesson: lesson)));
          },
          ),
        
          ),
        ),
  
            //Defining the second widget

            Padding(
              padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value){
                  debugPrint("Something changed in the Title text field");
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
            ),



            //Defining the third widget

            Padding(
              padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value){
                  debugPrint("Something changed in the description text field");
                },
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
            ),
            
 //Fourth element
          

          Padding(
            padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
            child: Row(
              children: <Widget>[

                //First raised button"Save"
                 Expanded(
                   child: RaisedButton(
                     color: Theme.of(context).primaryColorDark,
                     textColor: Theme.of(context).primaryColorLight,
                     child: Text(
                       "Save",
                       textScaleFactor: 1.5,
                     ),
                  onPressed: (){
                    setState(() {
                      debugPrint("Save Button clicked");
                    });
                  },

                   ),
                 ),


                //This container defines the space between the two buttons

                Container(
                 width: 5.0,
                ),


                //Second raised buttton "Delete"

                 Expanded(
                   child: RaisedButton(
                     color: Theme.of(context).primaryColorDark,
                     textColor: Theme.of(context).primaryColorLight,
                     child: Text(
                       "Delete",
                       textScaleFactor: 1.5,
                     ),
                  onPressed: (){
                    setState(() {
                      debugPrint("Delete Button Clicked");
                    });
                  },

                   ),
                 ),


              ],
            ),
          )

          

          ],
        ),
      ),
    )
    );
  }

  void moveToLastScreen(){
    //This is the code that performs the pop operation

    Navigator.pop(context);
  }
  
}