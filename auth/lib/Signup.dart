import 'package:flutter/material.dart';
import 'main.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
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
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  labelText: "Full Name",
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
                  hintText: "Cofirm Password",
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
                      "SignUp",
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
                      runApp(LoginPage());
                    },
                    child: Text(
                      "LogIn",
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
      ),
    );
  }
}
