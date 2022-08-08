import 'package:calculator/calculatorbtn.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  late int firstName;
  late int secondName;
   late String history ='';
  late String textToDisplay = '';
  late String res;
  late String operation;



  void btnOnClick(String btnVal){
    print(btnVal);
    if(btnVal == 'C'){
      textToDisplay = '';
      firstName = 0;
      secondName = 0;
      res = '';
    }else if(btnVal == 'AC'){
      textToDisplay = '';
      firstName =0;
      secondName = 0;
      res = '';
      history = '';
    } else if(btnVal == '+/-'){
      if(textToDisplay[0] != '-'){
        res = '-'+textToDisplay;
      }else{
        res = textToDisplay.substring(1);
      }
    } else if(btnVal == '<'){
      res = textToDisplay.substring(0, textToDisplay.length -1);
    }
    else if(btnVal == '+'||
        btnVal == '-' ||
        btnVal == 'X'||
        btnVal == '/'
    ){
      firstName = int.parse(textToDisplay);
      res = '';
      operation = btnVal;
    }else if(btnVal == '='){
      secondName = int.parse(textToDisplay);
      if(operation == '+'){
        res = (firstName + secondName).toString();
        history = firstName.toString() + operation.toString() + secondName.toString();
      }
      if(operation == '-'){
        res = (firstName - secondName).toString();
        history = firstName.toString() + operation.toString() + secondName.toString();
      }
      if(operation == 'X'){
        res = (firstName * secondName).toString();
        history = firstName.toString() + operation.toString() + secondName.toString();
      }
      if(operation == '/'){
        res = (firstName / secondName).toString();
        history = firstName.toString() + operation.toString() + secondName.toString();
      }
    }else {
      res = int.parse(textToDisplay + btnVal).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(
        title:const  Text('Calculator',
        style: TextStyle(
          fontSize: 20
        ),
        ),
        centerTitle: true,
      ),

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(right: 12),
                child: Text(history,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),

              Container(
                padding: EdgeInsets.all( 12),
                child: Text(textToDisplay,
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.black,
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton('AC', 20, 0xFFFFFFFFF, 0xFF4CAF50, btnOnClick),
                CalculatorButton('C', 20, 0xFFFFFFFFF, 0xFF4CAF50, btnOnClick),
                CalculatorButton('<', 20, 0xFFFFFFFFF, 0xFF827717, btnOnClick),
                CalculatorButton('X', 20, 0xFFFFFFFFF, 0xFF827717, btnOnClick),
          ],
        ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton('9', 20, 0xFFFFFFFFF, 0xFF4CAF50, btnOnClick),
                  CalculatorButton('8', 20, 0xFFFFFFFFF, 0xFF4CAF50, btnOnClick),
                  CalculatorButton('7', 20, 0xFFFFFFFFF, 0xFF4CAF50, btnOnClick),
                  CalculatorButton('/', 20, 0xFFFFFFFFF, 0xFF827717, btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton('6', 20, 0xFFFFFFFFF, 0xFF4CAF50, btnOnClick),
                  CalculatorButton('5', 20, 0xFFFFFFFFF, 0xFF4CAF50, btnOnClick),
                  CalculatorButton('4', 20, 0xFFFFFFFFF, 0xFF4CAF50, btnOnClick),
                  CalculatorButton('-', 20, 0xFFFFFFFFF, 0xFF827717, btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton('3', 20, 0xFFFFFFFFF, 0xFF4CAF50, btnOnClick),
                  CalculatorButton('2', 20, 0xFFFFFFFFF, 0xFF4CAF50, btnOnClick),
                  CalculatorButton('1', 20, 0xFFFFFFFFF, 0xFF4CAF50, btnOnClick),
                  CalculatorButton('+', 20, 0xFFFFFFFFF, 0xFF827717, btnOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton('+/-', 20, 0xFFFFFFFFF, 0xFF4CAF50, btnOnClick),
                  CalculatorButton('0', 20, 0xFFFFFFFFF, 0xFF4CAF50, btnOnClick),
                  CalculatorButton('00', 20, 0xFFFFFFFFF, 0xFF4CAF50, btnOnClick),
                  CalculatorButton('=', 20, 0xFFFFFFFFF, 0xFF827717, btnOnClick),
                ],
              ),

        ]
        )
      ),
    );
  }
}
