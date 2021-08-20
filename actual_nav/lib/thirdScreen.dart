import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  //const SecondScreen({Key key}) : super(key: key);
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Third Screen",
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Third Screen",
              style: TextStyle(
                fontSize: 34.0,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                color: Colors.blueAccent,
                child: Text(
                  "Nav to home",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                splashColor: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
