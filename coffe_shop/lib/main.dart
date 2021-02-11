import 'package:coffe_shop/page/main_page.dart';
import 'package:flutter/material.dart';

///This project is based on that "FlutterUI - Coffee shop - Speed Code" by Raja Yogan
///https://www.youtube.com/watch?v=pn5gfGIfBpI&feature=emb_logo

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
