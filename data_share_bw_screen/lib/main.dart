import 'package:flutter/material.dart';
import 'second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Data Share b/w page",
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
  String val = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data Share",
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              onChanged: (t){
                setState(() {
                  val = t;
                });
              },
            ),
            MaterialButton(
              onPressed : (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context)=>Second(val))),
                );
              },
              child: Text(
                "click",
              ),
              splashColor: Colors.grey,
              color: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }
}

