import 'package:flutter/material.dart';

class Second extends StatelessWidget {

  String value = "";
  Second(this.value);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Second",
        ),
      ),
      body: SecondPage(value),
    );
  }
}

class SecondPage extends StatefulWidget {
  //const SecondPage({Key key}) : super(key: key);

  String value="";
  SecondPage(this.value);

  @override
  _SecondPageState createState() => _SecondPageState(value);
}

class _SecondPageState extends State<SecondPage> {

  String val="";
  _SecondPageState(this.val);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        val,
      ),
    );
  }
}
