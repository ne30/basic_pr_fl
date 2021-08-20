import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nav_Bar',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
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
        title: Text('Scaffold'),
      ),
      bottomSheet: Container(
        child: Text(
          "this is bottom sheet",
        ),
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.bottomCenter,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 60.0,
                child: InkWell(
                    onTap: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.home),
                        Text("Home"),
                      ],
                    ),
                ),
              )
            ),
            Expanded(
                child: SizedBox(
                  height: 60.0,
                  child: InkWell(
                    onTap: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.search),
                        Text("Search"),
                      ],
                    ),
                  ),
                )
            ),
            Expanded(
                child: SizedBox(
                  height: 60.0,
                  child: InkWell(
                    onTap: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.menu),
                        Text("Menu")
                      ],
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}

