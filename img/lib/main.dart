import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:  AppBar(
          title: Text(
            "local_image"
          ),
        ),
        body: Center(
            child: Image.asset(
                "assets/images/pic.gif",
                height: 125.0,
                width: 425.0,
            ),
        ),
      ),
    );
  }
}

