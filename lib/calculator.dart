import 'package:flutter/material.dart';
// this library is used to evaluate mathematical expression which are in the form of string
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

List calculator_buttons = [
  "C",
  "⌫",
  "÷",
  "×",
  "7",
  "8",
  "9",
  "-",
  "4",
  "5",
  "6",
  "+",
  "1",
  "2",
  "3",
  "=",
  ".",
  "0",
  "00",
];

List colors = [
  Colors.red,
  Colors.red,
  Colors.blue,
  Colors.blue,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.blue,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.blue,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.red,
  Colors.yellow,
  Colors.yellow,
  Colors.yellow,
];

List text_colors = [
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.black,
  Colors.black,
  Colors.black,
  Colors.white,
  Colors.black,
  Colors.black,
  Colors.black,
  Colors.white,
  Colors.black,
  Colors.black,
  Colors.black,
  Colors.white,
  Colors.black,
  Colors.black,
  Colors.black,
];

String pressed_value = "";
String result = "";

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculator"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 390,
                height: 700,
                color: Color(0xffdcdde1),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // color: Colors.red,
                      width: 390,
                      height: 50,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          "$pressed_value",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // color: Colors.red,
                      width: 390,
                      height: 50,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          "${result}",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: calculator_buttons.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              String buttons_value = calculator_buttons[index];
                              if (buttons_value == "C") {
                                pressed_value = "";
                                result = "";
                                setState(() {});
                              } else if (buttons_value == "⌫") {
                                if (pressed_value != "") {
                                  pressed_value = pressed_value.substring(
                                      0, pressed_value.length - 1);
                                }
                                setState(() {});
                              } else if (buttons_value == "=") {
                                String final_value = pressed_value;
                                final_value = final_value.replaceAll("×", "*");
                                final_value = final_value.replaceAll("÷", "/");
                                try {
                                  Parser p = Parser();
                                  Expression exp = p.parse(final_value);
                                  ContextModel cm = ContextModel();
                                  double eval =
                                      exp.evaluate(EvaluationType.REAL, cm);

                                  result = eval.toString();
                                  if (result.split(".")[1] == "0") {
                                    result = result.split(".")[0];
                                  } else {
                                    result = eval.toStringAsFixed(3);
                                  }
                                  setState(() {});
                                } catch (error) {
                                  print(error);
                                }
                              } else {
                                pressed_value += calculator_buttons[index];
                              }
                              setState(() {});
                            },
                            child: Container(
                              color: colors[index],
                              child: Center(
                                  child: Text(
                                "${calculator_buttons[index]}",
                                style: TextStyle(
                                    color: text_colors[index],
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
