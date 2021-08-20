import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'Signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Positioned(
            child: Image.asset(
              "assets/images/pic.png",
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                labelText: "User Name",
                hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14),
                contentPadding: EdgeInsets.all(20.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20.0),
                border: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(15.0),
                child: MaterialButton(
                  onPressed: () {
                    runApp(SuccessLogin());
                  },
                  child: Text(
                    "Login",
                  ),
                  splashColor: Colors.deepOrange,
                  padding: EdgeInsets.all(20.0),
                  color: Colors.orange,
                ),
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                child: MaterialButton(
                  onPressed: () {
                    runApp(Signup());
                  },
                  child: Text(
                    "Signup",
                  ),
                  splashColor: Colors.deepOrange,
                  padding: EdgeInsets.all(20.0),
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    ),);
  }
}

class SuccessLogin extends StatefulWidget {
  @override
  _SuccessLoginState createState() => _SuccessLoginState();
}

class _SuccessLoginState extends State<SuccessLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
      body: Column(
        children: <Widget> [Text(
          "Success",
        ),
        Container(
          margin: EdgeInsets.all(15.0),
          child: MaterialButton(
            onPressed: () {
              runApp(Signup());
            },
            child: Text(
              "Signup",
            ),
            splashColor: Colors.deepOrange,
            padding: EdgeInsets.all(20.0),
            color: Colors.orange,
          ),
        ),
        ],
    ),
      ),
    );
  }
}
