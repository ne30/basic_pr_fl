import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonValue;
  final status;

  MyButton({this.color, this.textColor, required this.buttonValue, this.status});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: status,
      child: Padding(
        padding: EdgeInsets.all(1.0),
        child: ClipRRect(
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonValue,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
