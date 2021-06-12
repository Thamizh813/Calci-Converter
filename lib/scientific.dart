import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

import 'buttons.dart';

void main() {
  runApp(Scientific());
}

class Scientific extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scien(),
    );
  }
}

class Scien extends StatefulWidget {
  @override
  _ScienState createState() => _ScienState();
}

class _ScienState extends State<Scien> {
  String userinput = '';
  String answer = '';
  static const log = 'log';
  final List<String> buttons = [
    'C',
    '(',
    ')',
    'BACK',
    'log',
    ',',
    'n!',
    'Cos',
    'Sin',
    'Tan',
    'acos',
    'asin',
    'atan',
    'max',
    'min',
    '%',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '^',
    '+',
    'pi',
    'e',
    '=',
    'ln',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SCIENTIFIC CALCULATOR',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userinput,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: Text(
                      answer,
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
          ),
          Expanded(
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // Clear Button
                    if (index == 0) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput = '';
                            answer = '0';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.deepOrange,
                        textColor: Colors.white,
                      );
                    } else if (index == 3) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput =
                                userinput.substring(0, userinput.length - 1);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.deepOrange,
                        textColor: Colors.white,
                      );
                    } else if (index == 1) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                      );
                    } else if (index == 2) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.blueGrey,
                        textColor: Colors.white,
                      );
                    } else if (index == 4) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue,
                        textColor: Colors.black,
                      );
                    } else if (index == 5) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue,
                        textColor: Colors.black,
                      );
                    } else if (index == 6) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue,
                        textColor: Colors.black,
                      );
                    } else if (index == 7) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue,
                        textColor: Colors.black,
                      );
                    } else if (index == 8) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue,
                        textColor: Colors.black,
                      );
                    } else if (index == 9) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue,
                        textColor: Colors.black,
                      );
                    } else if (index == 10) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue,
                        textColor: Colors.black,
                      );
                    } else if (index == 11) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue,
                        textColor: Colors.black,
                      );
                    } else if (index == 12) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput = pi.toString() + buttons[index];
                            answer += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue,
                        textColor: Colors.black,
                      );
                    } else if (index == 13) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue,
                        textColor: Colors.black,
                      );
                    } else if (index == 14) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue,
                        textColor: Colors.black,
                      );
                    } else if (index == 15) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.black,
                        textColor: Colors.white,
                      );
                    }

                    // Equal_to Button
                    else if (index == 34) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.deepOrange,
                        textColor: Colors.white,
                      );
                    } else if (index == 32) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput = pi.toString();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue[200],
                        textColor: Colors.black,
                      );
                    } else if (index == 33) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += e.toString();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue[200],
                        textColor: Colors.black,
                      );
                    } else if (index == 35) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue[200],
                        textColor: Colors.black,
                      );
                    }

                    // other buttons
                    else {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userinput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.black
                            : Colors.grey,
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.black,
                      );
                    }
                  }), // GridView.builder
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' ||
        x == 'x' ||
        x == '-' ||
        x == '+' ||
        x == '=' ||
        x == '^' ||
        x == '%') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finaluserInput = userinput;

    finaluserInput = userinput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserInput);
    ContextModel cm = ContextModel();
    final eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

mixin Math {}
