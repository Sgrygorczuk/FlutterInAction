import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_in_action/chapterTwo.dart';

void main() {
  //chapterTwoFunctions();
  runApp(chapterThree());
}

void chapterTwoFunctions(){
  //Creating an object you can either define it as chapterTwo or just use var in
  //the declaration
  var chapterTwoObject = new chapterTwo("Tom");

  //The ?. check if the objects data is null before assigning it
  String checkName = chapterTwoObject?.nullName;
  //If the data is null is just sets the new input as null too
  print(checkName);

  //The ?? check if it's null and if it is you give it a generic value
  checkName = chapterTwoObject.nullName ?? "Jimmy";
  print(checkName);

  //The ??= operator will change the object value if it is currently null
  //In this case it won't change it b/c it's already assigned a value
  checkName ??= "Potter";
  print(checkName);
}



class chapterThree extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //Used to show how elements work
  bool _reversed = false;
  List<UniqueKey> _buttonKeys = [UniqueKey(), UniqueKey()];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  //The function gets placed
  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  }

  //The function gets placed
  void _reset(){
    setState(() {
      _counter = 0;
      _swap();
    });
  }

  void _swap(){
    setState(() {
      _reversed = !_reversed;
      _buttonKeys.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Creates a little box that contains color and edge info, and margins.
            Container(
              margin: EdgeInsets.only(bottom: 100.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.25),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Image.asset(
                'flutter_logo.png',
                width: 100.0,
              ),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              //mainAxisAlignment tells how to distribute the widgets in the window
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FancyButton(
                    key: _buttonKeys.first,
                    child: Text(
                      "Decrement",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _decrementCounter,
                  ),
                  FancyButton(
                    key: _buttonKeys.last,
                    child: Text(
                      "Increment",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _incrementCounter,
                  ),
                ],
            ),
          ],
        ),
      ),
      //Moded this function to change the icon to a refresh and changed what function it attaches to
      floatingActionButton: FloatingActionButton(
        onPressed: _reset,    //No () when calling funtction
        tooltip: 'Reset Counter',
        child: Icon(Icons.refresh), //Can change the image
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//The fancy button class that will help us see how elements are acting
class FancyButton extends StatefulWidget{
  final VoidCallback onPressed;
  final Widget child;

  const FancyButton({Key key, this.onPressed, this.child}) : super(key: key);

  @override
  _FancyButtonState createState() => _FancyButtonState();
}

class _FancyButtonState extends State<FancyButton>{

  //The Wiget look, a button isnide a contaier
  @override
  Widget build(BuildContext context){
    return Container(
      child: RaisedButton(
        color: _getColors(),
        child: widget.child,
        onPressed: widget.onPressed,
      ),
    );
  }

  //Gets the color from the Map
  Color _getColors(){
    return _buttonColors.putIfAbsent(this, () => colors[next(0,5)]);
  }

  Map<_FancyButtonState, Color> _buttonColors = {};
    final _random = Random();

    //Function for the next color based on some random shit
    int next(int min, int max) => min + _random.nextInt(max - min);

    //List of the colors a button can be
    List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.amber,
      Colors.lightBlue,
    ];
}