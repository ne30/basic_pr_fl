import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  //const SecondScreen({Key key}) : super(key: key);
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Second Screen",
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Second Screen",
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
                color: Colors.orange,
                child: Text(
                  "Nav to home",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.blueGrey,
                  ),
                ),
                splashColor: Colors.deepOrange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
