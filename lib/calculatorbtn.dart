import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
 final  String text;
 final int colo;
 final int fillColor;
 final int textSize;
 final Function callback;
    CalculatorButton(
     this.text,  this.textSize,  this.colo,  this.fillColor, this.callback,
);
   @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      height: 60,
      width: 60,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: () => callback(text),
        child: Text(text,
          style: TextStyle(
            fontSize:  20,
            color: Color(colo),
          ),
        ),
        color: Color(fillColor),
      ),
    );
  }
}
