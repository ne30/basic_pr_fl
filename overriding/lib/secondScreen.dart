import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:io';
import 'dart:core';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SecondScreen extends StatefulWidget {
  //const SecondScreen({Key key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  DateTime curr = DateTime(2000,1,1,10,0,0);
  //Using subsequent back tap more or equal to 2
  Future<bool> popped(){
    DateTime now = DateTime.now();
    if(now.difference(curr)>Duration(seconds: 2)) {
        curr = now;
        Fluttertoast.showToast(
          msg: "Press again to exit",
          toastLength: Toast.LENGTH_SHORT,
        );
        return Future.value(false);
    }
    else{
      Fluttertoast.cancel();
      return Future.value(true);
    }
  }

  // Using warning exiting the app
  Future<bool> _onWillPop() async{
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              Navigator.of(context).pop(false);
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
              //Effect of crash via exit(0)
              //exit(0);
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: popped,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Second Screen",
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Second Screen Center",
              ),
            )
          ],
        ),
      ),
    );
  }
}
