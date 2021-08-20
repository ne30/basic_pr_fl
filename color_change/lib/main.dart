import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "text",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  bool _val = false;
  void _chng(){
    setState(() {
      _val = !_val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Color shift"),
      ),
      backgroundColor: _val ? Colors.teal : Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: _chng,
        tooltip: 'Change',
        child: Text("change"),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(18.0),
              primary: _val ? Colors.white : Colors.teal,
              textStyle: const TextStyle(fontSize: 30),
            //backgroundColor: _val ? Colors.white : Colors.teal,
          ),
          onPressed: _chng,
          child: const Text('Change'),
        ),
      ),
    );
  }
}
