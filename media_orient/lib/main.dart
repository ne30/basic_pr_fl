import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp()({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Media Orient",
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

  Widget portr(){
    return Center(
      child: Text(
        "Portrait",
      ),
    );
  }

  Widget lands(){
    return Center(
      child: Text(
        "Landscape",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Media Query",
        ),
      ),
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: <Widget>[
      //     Container(
      //       width: MediaQuery.of(context).size.width * 0.4,
      //       decoration: BoxDecoration(
      //         color: Colors.deepOrange,
      //       ),
      //     ),
      //     Container(
      //       width: MediaQuery.of(context).size.width * 0.4,
      //       decoration: BoxDecoration(
      //         color: Colors.green,
      //       ),
      //     ),
      //   ],
      // ),
      body: OrientationBuilder(
        builder: (context, orientation){
          if(orientation == Orientation.portrait){
            return portr();
          }else{
            return lands();
          }
        },
      ),
    );
  }
}
