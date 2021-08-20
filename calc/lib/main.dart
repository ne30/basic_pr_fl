import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'MyButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  // const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String ans = '';
  String currInput = '';

  final List<String> buttons = [
    'C','+/-','%','del',
    '7','8','9','/',
    '4','5','6','x',
    '1','2','3','-',
    '0','.','=','+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
            "Calculator",
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        currInput,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        ans,
                      ),
                    )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4
                ),
                itemBuilder: (BuildContext context, int id){
                  if(id==0){
                      return MyButton(
                          status: (){
                            setState(() {
                              currInput = '';
                              ans = '0';
                            });
                          },
                        buttonValue: buttons[id],
                        color: Colors.blueGrey,
                        textColor: Colors.black,
                      );
                  }
                  else if (id==2){
                    return MyButton(
                      status: (){
                        setState(() {
                          currInput += buttons[id];
                        });
                      },
                      buttonValue: buttons[id],
                        color: Colors.blueGrey,
                        textColor: Colors.black,
                    );
                  }
                  else if (id==1){
                    return MyButton(
                      status: (){},
                      buttonValue: buttons[id],
                      color: Colors.blueGrey,
                      textColor: Colors.black,
                    );
                  }
                  else if(id==3){
                    return MyButton(
                      status: (){
                        setState(() {
                          currInput = currInput.substring(0,currInput.length-1);
                        });
                      },
                      buttonValue: buttons[id],
                      color: Colors.tealAccent,
                      textColor: Colors.black,
                    );
                  }
                  else if (id == 18) {
                    return MyButton(
                      status: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      buttonValue: buttons[id],
                      color: Colors.orange[700],
                      textColor: Colors.white,
                    );
                  }

                  //  other buttons
                  else {
                    return MyButton(
                      status: () {
                        setState(() {
                          currInput += buttons[id];
                        });
                      },
                      buttonValue: buttons[id],
                      color: isOperator(buttons[id])
                          ? Colors.tealAccent
                          : Colors.teal,
                      textColor: isOperator(buttons[id])
                          ? Colors.grey
                          : Colors.black,
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isOperator(String s){
    if(s=='/' || s=='x' || s=='-' || s=='+' || s=='=')
      return true;
    return false;
  }

  void equalPressed(){
    String finalInput = currInput;
    finalInput = currInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalInput);
    ContextModel cm = ContextModel();
    double val = exp.evaluate(EvaluationType.REAL, cm);
    ans = val.toString();
  }

}

