import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      //Removes the Debug Banner
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Calculator();
}

class _Calculator extends State<Calculator>{
  //============================= Variables ====================================
  String equation = "0";      //User Input Text
  String result = "0";        //Result of User Input
  double equationFontSize = 38.0;   //Size of the user input font
  double resultFontSize = 48.0;     //Size of the result font
  //============================================================================

  //============================== Methods =====================================
  ///*
  ///Purpose: Adds/Removes selected text to the equation, clears and parses
  ///through the equation to display result
  ///Inputs: @buttonText used to select which action the user is performing
  ///Return: Void
  void buttonPressed(String buttonText){
    setState(() {
      //Clears the data and resets it
        if(buttonText == "C"){
          equation = "0";
          result = "0";
          equationFontSize = 38.0;
          resultFontSize = 48.0;
        }
        //Delete last input character
        else if(buttonText == "«"){
          equationFontSize = 38.0;
          resultFontSize = 48.0;
          equation = equation.substring(0, equation.length-1);
          //If equations empties out just make it 0 again
          if(equation.isEmpty){equation = "0";}
        }
        else if(buttonText == "="){
          equationFontSize = 38.0;
          resultFontSize = 48.0;
          //We use a library that does the Parsing and solving for us
          //We use the try and catch block to make sure it executes
          //correctly or throws up an error.
          try{
            Parser p = new Parser();
            Expression exp = p.parse(equation);
            ContextModel cm = ContextModel();
            result = "${exp.evaluate(EvaluationType.REAL, cm)}";
          }catch(e){
            result = "Error";
          }
        }
        else{
          equationFontSize = 38.0;
          resultFontSize = 48.0;
          //If we added something and we still have 0 in front
          //get rid of zero
          if(equation == "0"){equation = buttonText;}
          //Otherwise add stuff
          else {equation += buttonText;}
        }
    });
  }
  //============================================================================

  ///*
  ///All the buttons go through here, they have
  ///Inputs: @buttonText will be written on the button
  ///        @buttonHeight deterimsn how big the button is
  ///        @buttonColor sets the color of the button
  ///Return: A container with the button functionality
  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
                color: Colors.white,
                width: 1,
                style: BorderStyle.solid
            )
        ),
        padding: EdgeInsets.all(16.0),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Big box on top of the screen with a title 
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          //Two containers that hold the user input and result
          Container(
            alignment: Alignment.centerRight,
            //Sets padding around all edges
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
                equation,
                style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            //Sets padding around all edges
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          //Divider that breaks up
          Expanded(
              child: Divider(),

          ),
          //The rows of the buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //We broke it down into two tables, a 3x5 and a 1x4
              //This way we can have the equal button be a different size
              //This table is the 3x5
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("C", 1, Colors.redAccent),
                        buildButton("«", 1, Colors.blue),
                        buildButton("/", 1, Colors.blue),
                      ]
                    ),
                    TableRow(
                        children: [
                          buildButton("7", 1, Colors.black),
                          buildButton("8", 1, Colors.black),
                          buildButton("9", 1, Colors.black),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("4", 1, Colors.black),
                          buildButton("5", 1, Colors.black),
                          buildButton("6", 1, Colors.black),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("1", 1, Colors.black),
                          buildButton("2", 1, Colors.black),
                          buildButton("3", 1, Colors.black),
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton(".", 1, Colors.black),
                          buildButton("0", 1, Colors.black),
                          buildButton("00", 1, Colors.black),
                        ]
                    ),
                  ],
                ),
              ),
              //This is the 1x4 table
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("*", 1, Colors.blue)
                      ]
                    ),
                    TableRow(
                        children: [
                          buildButton("-", 1, Colors.blue)
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("+", 1, Colors.blue)
                        ]
                    ),
                    TableRow(
                        children: [
                          buildButton("=", 2, Colors.blue)
                        ]
                    )
                  ],
                ),
              )
            ],
          )
        ],
      )
    );
  }
}