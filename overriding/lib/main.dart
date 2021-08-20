import 'package:flutter/material.dart';
import 'dart:async';
import 'secondScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "OverRide",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    super.initState();
    debugPrint("the splash screen");
    Timer(Duration(seconds: 3),finished);
  }

  void finished(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context)=>SecondScreen()),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "the splash screen",
                style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "Cursive",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
