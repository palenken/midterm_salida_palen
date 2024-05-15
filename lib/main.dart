import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';
  String result = '';

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      display = '0';
      num1 = 0;
      num2 = 0;
      operand = '';
      result = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '/') {
      num1 = double.parse(display);
      operand = buttonText;
      display = '0';
    } else if (buttonText == '=') {
      num2 = double.parse(display);
      if (operand == '+') {
        result = (num1 + num2).toString();
      }
      if (operand == '-') {
        result = (num1 - num2).toString();
      }
      if (operand == 'x') {
        result = (num1 * num2).toString();
      }
      if (operand == '/') {
        result = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = '';
      display = result;
    } else {
      if (display == '0') {
        display = buttonText;
      } else {
        display = display + buttonText;
      }
    }
    setState(() {
      display = display;
      result = result;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(2.0), // Adjust padding if needed
        child: OutlinedButton(
          onPressed: () => buttonPressed(buttonText),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.black, width: 1.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Add padding to all sides
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  display,
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('/'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('x'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('-'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('C'),
                buildButton('0'),
                buildButton('='),
                buildButton('+'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
