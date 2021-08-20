import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title: Text("Screen_1"),
        ),
        body: Center(
          child: MaterialButton(
            child: Text(
              "nav to 2",
            ),
            onPressed: (){
              runApp(MyApp2());
              // Navigator.push(
              //   context, MyApp2()
              // );
            },
          ),
        ),
      ),
    );
  }
}

class MyApp2 extends StatelessWidget {
  // const MyApp2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title: Text("Screen_2"),
        ),
        body: Center(
          child: MaterialButton(
            child: Text(
              "nav to 1",
            ),
            onPressed: (){
              runApp(MyApp());
              //Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

