import 'package:flutter/material.dart';
import 'dart:convert';

class GetJson extends StatelessWidget {
  const GetJson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/python.json"),
      builder: (context, snapshot){
        var myData = json.decode(snapshot.data.toString());
        if(myData == null){
          return Scaffold(
            body: Center(
              child: Text(
                "Loading.."
              ),
            ),
          );
        }
        else{
          return QuizPage();
        }
      },
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

