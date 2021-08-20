import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'secondScreen.dart';
import 'thirdScreen.dart';

// stack looping might happen in using the screen beware

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/second': (context) => SecondScreen(),
        '/third' : (context) => ThirdScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: "NAV",
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Bar",
          style: TextStyle(
            fontFamily: "Italics",
            fontSize: 18.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Home",
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: ((context)=>SecondScreen())),
                    // );
                    Navigator.pushNamed(context, '/second');
                  },
                  color: Colors.tealAccent,
                  child: Text(
                    "nav to second",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                  splashColor: Colors.teal,
              ),
              MaterialButton(
                onPressed: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: ((context)=>SecondScreen())),
                  // );
                  Navigator.pushNamed(context, '/third');
                },
                color: Colors.tealAccent,
                child: Text(
                  "nav to third",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.blueGrey,
                  ),
                ),
                splashColor: Colors.teal,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
