import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Timer",
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  //const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  TabController? _tb;
  int h = 0;
  int m = 0;
  int s = 0;
  bool started = true;
  bool stopped = true;
  int timeVal = 0;
  String timeToDisplay = "";

  @override
  void initState(){
    _tb = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  void convert(){
    if(timeVal == 0){
      setState(() {
        timeToDisplay = "";
      });
    }
    else{
      int temp = timeVal;
      String tempString = "";
      tempString = ((temp/3600).toInt()).toString() + "Hour ";
      temp = temp%3600;
      tempString += ((temp/60).toInt()).toString() + "Min ";
      temp = temp%60;
      tempString += temp.toString() + "Sec ";
      setState(() {
        timeToDisplay = tempString;
      });
      //debugPrint(tempString);
    }
  }

  void start(){
    setState(() {
      started = false;
      stopped = false;
    });
    timeVal = h*3600 + m*60 + s;
    if(timeVal==0){
      setState(() {
        started = true;
        stopped = true;
      });
    }
    Timer.periodic(Duration(
      seconds: 1,), (Timer t){
        setState(() {
          if(timeVal<1){
            t.cancel();
            convert();
            if(stopped==false)
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          }else{
            convert();
            timeVal -= 1;
          }
        });
    });
  }

  void stop(){
    setState(() {
      started = true;
      stopped = true;
      timeVal = 0;
    });
  }

  Widget timer(){
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //1
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "HH",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      NumberPicker(minValue: 0, maxValue: 23, value: h, onChanged: (val){
                        setState(() {
                          h = val;
                        });
                      }),
                    ],
                  ),
                  //2
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "MM",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      NumberPicker(minValue: 0, maxValue: 59, value: m, onChanged: (val){
                        setState(() {
                          m = val;
                        });
                      }),
                    ],
                  ),
                  //3
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "SS",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      NumberPicker(minValue: 0, maxValue: 59, value: s, onChanged: (val){
                        setState(() {
                          s = val;
                        });
                      }),
                    ],
                  ),
                ],
              )
          ),
          Expanded(
              flex: 1,
              child: Text(
                timeToDisplay,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                      onPressed: started ? start : null,
                      child: Text(
                        "Start",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.green,
                      disabledColor:  Colors.grey,
                      padding: EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                      ),
                  ),
                  MaterialButton(
                    onPressed: stopped ? null : stop,
                    child: Text(
                      "Stop",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    disabledColor:  Colors.grey,
                    color: Colors.red,
                    padding: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }

  int stopH = 0;
  int stopM = 0;
  int stopS = 0;
  String stopVal = "00:00:00";
  String stopString = "";
  bool stopStart = true;
  bool stopStop = true;

  void stopConvert(){
    setState(() {
      String temp =  "";
      if(stopH<10){
        temp = temp + "0" + stopH.toString() + ":";
      }
      else{
        temp = temp +  stopH.toString() + ":" ;
      }
      if(stopM<10){
        temp = temp + "0" + stopM.toString() + ":";
      }
      else{
        temp = temp +  stopM.toString() + ":" ;
      }
      if(stopS<10){
        temp = temp + "0" + stopS.toString();
      }
      else{
        temp = temp +  stopS.toString();
      }
      stopVal = temp;
    });
    // debugPrint(stopVal);
  }

  void stopStartFunc(){
    setState(() {
      stopStart = false;
      stopStop = false;
    });
    Timer.periodic(
        Duration(seconds: 1),
        (Timer t) {
          setState(() {
            if(stopStop == true){
              t.cancel();
            }
            else{
              if(stopS == 59){
                stopS = 0;
                if(stopM==59){
                  stopM = 0;
                  stopH += 1;
                }
                else{
                  stopM += 1;
                }
              }
              else{
                stopS += 1;
              }
            }
            stopConvert();
          });
        });
  }

  void stopStopFunction(){
    setState(() {
      stopStart = stopStop = true;
      stopH = stopM = stopS = 0;
      stopString = stopVal;
      stopVal = "00:00:00";
    });
  }

  Widget stopWatch(){
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      stopVal,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              stopString,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex:2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  onPressed: stopStart ? stopStartFunc : null,
                  child: Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.green,
                  disabledColor:  Colors.grey,
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                MaterialButton(
                  onPressed: stopStop ? null : stopStopFunction,
                  child: Text(
                    "Stop",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  disabledColor:  Colors.grey,
                  color: Colors.red,
                  padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            "Timer",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 24.0,
          ),
        ),
        bottom: TabBar(
          tabs: <Widget>[
            Text(
              "Timer",
            ),
            Text(
            "Stopwatch",
            ),
          ],
        labelPadding: EdgeInsets.all(5.0),
        unselectedLabelColor: Colors.red,
        controller: _tb,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          timer(),
          stopWatch(),
        ],
        controller: _tb,
      ),
    );
  }
}
