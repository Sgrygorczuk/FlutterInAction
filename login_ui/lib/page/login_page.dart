import 'package:flutter/material.dart';
import 'package:login_ui/widget/profile.dart';

import 'homepage.dart';

class LoginPage extends StatefulWidget{
  //Router tag used to move between the pages
  static String tag = "login-page";
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  //========================= Methods ==========================================
  ///Purpose: Pre-make a button
  ///Input: @keyBoard tells us if the keyboard should be preset to help type out
  ///       an email and if the text should be obscured or not
  ///       @initialValue what the textbox say when the page is turned on
  ///       @hintText the title of the box
  ///Return: Pre-made text field
  TextFormField textBox(bool keyBoard, String initialValue, String hintText) {
    return TextFormField(
      //Tells the phone if the keyboard should be structured to make an email
      keyboardType: keyBoard ? TextInputType.emailAddress : null,
      //Tells the field to see if the text should be obscured
      obscureText : keyBoard ? false : true,
      autofocus: false,
      //What is inside the text field
      initialValue: initialValue,
      decoration: InputDecoration(
        //Text box title
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );
  }
  //============================================================================

  //======================== Widgets ===========================================
  @override
  Widget build(BuildContext context) {

    //We pre made the widgets and then put them into a scaffold
    //We make the profile logo
    final logo = profile("hero", 48, "assets/logo.png", true);
    //Make the text boxes
    final email = textBox(true, "alucad@gmail.com", "Email");
    final password =  textBox(false, "Password", "Password");

    //We create the login button
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          //We use this button to go to the other page
          Navigator.of(context).pushNamed(HomePage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text(
            'Log In',
            style: TextStyle(color: Colors.white)
        ),
      ),
    );

    //Doesn't do much
    final forgotLabel = FlatButton(
        onPressed:(){

        },
        child: Text(
          "Forgot password?",
          style: TextStyle(
            color: Colors.black54
          ),
        )
    );

    //Scaffold is the place where it all comes together
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left : 24, right : 24),
          children: [
            //Just dumped the widgets in with small box sized padding between them
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel,
          ],
        ),
      ),
    );
  }
  //============================================================================
}