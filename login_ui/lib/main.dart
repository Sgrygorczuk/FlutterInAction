import 'package:flutter/material.dart';
import 'package:login_ui/page/homepage.dart';
import 'package:login_ui/page/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  //===================== Variables ============================================

  //The routes allow us to go between different pages
  final routes = <String, WidgetBuilder>{
    //We use tags to do so
    LoginPage.tag : (context) => LoginPage(),
    HomePage.tag : (context) => HomePage()
  };

  //============================================================================

  //============================ Widgets =======================================
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //Input the font, had to be pre set in pubspec.yaml
        fontFamily: "Nunito",
      ),
      //Tells us to go to LoginPage
      home: LoginPage(),
      //Checks the routes
      routes: routes,
    );
  }
  //============================================================================
}
