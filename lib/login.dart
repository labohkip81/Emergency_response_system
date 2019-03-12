import 'package:flutter/material.dart';
import './sign_up.dart';

void main() => runApp(FirstRoute());

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/sign_up':(BuildContext) => SignUp(),
        '/login':(BuildContext)=>FirstRoute()
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 130.0,
                    left: 15.0,
                  ),
                  child: Text('There',
                      style: TextStyle(
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
            padding: EdgeInsets.only(top: 35.0, left: 15.0),
            child: Column(
              children: <Widget>[
                
                TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, 
                        color: Colors.grey
                        ),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
                  ),
                   validator:(value)=>value.isEmpty ? "Email can\ 't be empty":null,
                   onSaved: (value)=>_email=value,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  maxLines: 1,
                  maxLength: 8,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, 
                        color: Colors.grey
                        ),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
                  ),
                  validator:(value)=> value.isEmpty ? "Password can\'t be empty":null,
                  onSaved: (value)=>_password=value,
              
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(left: 20.0, top: 15.0),
                  child: InkWell(
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(height: 40.0,),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: (){},
                      child: Center(
                        child: Text(
                          'LOGIN',
                        style:TextStyle(
                          color:Colors.white ,
                          fontWeight: FontWeight.bold)),
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  height: 40.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:Colors.black,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(child:
                         ImageIcon(AssetImage('assets/google.png')),),
                         SizedBox(width: 20.0,),
                         Center(
                           child: Text('Login using Google',
                           style:TextStyle(fontWeight: FontWeight.bold)),
                         )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15.0,),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('New to K-Dharura?',
              style:TextStyle(
                fontWeight:FontWeight.bold,)),
                SizedBox(width: 5.0,),
                
                InkWell(
                  onTap: (){
                   Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SignUp(),
                settings: RouteSettings(name: 'sign_up')),
          );
                  },
                  child: Text('Register',
                  style:TextStyle(
                    fontWeight:FontWeight.bold,
                    color:Colors.green,
                    decoration: TextDecoration.underline,
                  )),

                ),
            ],
          )
        ],
      ),
    );
  }
}
