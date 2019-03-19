import 'package:flutter/material.dart';
import 'package:kdharura/data/databasehelper.dart';
import 'package:kdharura/model/user.dart';
import 'package:kdharura/pager/login_page.dart';
import './sign_up.dart';
import './main.dart';
import'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';


void main() => runApp(FirstRoute());

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new LoginPage(),
      routes: <String,WidgetBuilder>{
        '/sign_up':(BuildContext) => SignUp(),
        '/login':(BuildContext)=>FirstRoute()
      }
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract{
  BuildContext _ctx;
  bool _isLoading;
  final formKey=new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  LoginPagePresenter _presenter;

  _LoginPageState(){
    _presenter = new LoginPagePresenter(this);
  }

  void _submit(){
    final form =formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading =true;
        form.save();
        _presenter.doLogin(_username, _password);
      });
      
    }
  }
  void _showSnackBar(String text){
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content:new Text(text) ,));
  }


 
  



// defines the bottom navigation bar;

final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.camera_alt, color: Colors.white,),
              onPressed: () {
                
              },
            ),
            IconButton(
              icon: Icon(Icons.location_on, color: Colors.white),
              onPressed: () {

         

              },
            ),
            IconButton(
              icon: Icon(Icons.message, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(

              icon: Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {
               
              },

            )
          ],
        ),
      ),
    );

  @override
  Widget build(BuildContext context) {
    _ctx =context; 
    
      
    
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      bottomNavigationBar: makeBottom,
      resizeToAvoidBottomPadding: false,
      body: new ListView(
        
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 70.0,
                    left: 15.0,
                    
                  ),
                  child: Text('Hello',
                      style: TextStyle(color: Colors.white,
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 130.0,
                    left: 15.0,
                  ),
                  child: Text('There',
                      style: TextStyle(color: Colors.white,
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 100.0,
                    left: 200.0,
                  ),
                  child: Text('.',
                      style: TextStyle(
                          fontSize: 100.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 15.0,right: 15.0),
            child:Form(
              key: formKey,

            child: Column(
              children: <Widget>[
                
                TextFormField(
                  validator: (String arg){
                    if (arg.length < 3) 
                      return 'Name must be more than two letters';
                    else
                      return null;
                  },
                  maxLines: 1,
                  onSaved: (val)=>_username =val,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'USERNAME',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, 
                        color: Colors.white
                        ),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onSaved: (val) => this._password = val,
                  obscureText: true,
                  // onSaved: (val)=>_password =val,
                   validator: (val) =>val.length < 6 ? 'Password too short.' : null,
                  maxLines: 1,
                  maxLength: 10,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, 
                        color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
                  ),
               
                ),
                SizedBox(
                  height: 5.0,
                ),
              
                SizedBox(height: 40.0,),
                Container(
                  
                  
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.transparent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed:_submit,
                      child: Center(
                        child: Text(
                          'SUBMIT',
                        style:TextStyle(
                          color:Colors.black ,
                          fontWeight: FontWeight.bold)),
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 20.0,),
          
              ],
            ),
          ),
          ),
          
         ],
      ),
      
    );
    
  
}

  @override
  void onLoginError(String error) {
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    _showSnackBar(user.toString());
    setState(() {
      _isLoading = false;
     
    });
    var db = new DatabaseHelper();
    await db.saveUser(user);
    Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));
    
  }
}