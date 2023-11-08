import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  num x = 0;
  num y = 0;
  var input = '';
  var output = '';
  var operation = '';

  onButtonClick(value) {
    if (value == "AC") {
      input = "";
      output = "";
    } else if (value == "<") {
      input = input.substring(0, input.length - 1);
    } else if (value == "=") {
      var userInput = input;
      Parser p = Parser();
      Expression e = p.parse(userInput);

      ContextModel cm = ContextModel();

      var answer = e.evaluate(EvaluationType.REAL, cm);
      output = answer.toString();
    } else {
      input = input + value;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            color: Colors.black,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input,
                    style: TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    output,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ]),
          )),
          Row(
            children: [
              button(text: "AC", buttonBgColor: Colors.red),
              button(text: "<", buttonBgColor: Colors.red),
              button(text: "+/-", buttonBgColor: Colors.red),
              button(text: "/", buttonBgColor: Colors.red),
            ],
          ),
          Row(
            children: [
              button(
                text: "7",
              ),
              button(text: "8"),
              button(
                text: "9",
              ),
              button(text: "*", buttonBgColor: Colors.red),
            ],
          ),
          Row(
            children: [
              button(
                text: "4",
              ),
              button(text: "5"),
              button(
                text: "6",
              ),
              button(text: "-", buttonBgColor: Colors.red),
            ],
          ),
          Row(
            children: [
              button(
                text: "1",
              ),
              button(text: "2"),
              button(
                text: "3",
              ),
              button(text: "+", buttonBgColor: Colors.red),
            ],
          ),
          Row(
            children: [
              button(
                text: "%",
              ),
              button(text: "0"),
              button(
                text: ".",
              ),
              button(text: "=", buttonBgColor: Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({
    text,
    tColor = Colors.white,
    buttonBgColor = Colors.grey,
  }) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(18),
            backgroundColor: buttonBgColor),
        onPressed: () => onButtonClick(text),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: tColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
