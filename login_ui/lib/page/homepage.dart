import 'package:flutter/material.dart';
import 'package:login_ui/widget/profile.dart';

class HomePage extends StatelessWidget{
  //=============================== Variables ==================================
  //Route tag used to move between pages
  static String tag = "home-page";
  //============================================================================

  //=========================== Widgets ========================================
  @override
  Widget build(BuildContext context){

    //The user profile image
    final user = profile('hero', 72.0, "assets/alucard.jpg", false);

    //Welcome text
    final welcome = Padding(
        padding:EdgeInsets.all(8.0),
        child: Text(
          "Welcome Alucard",
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.white
          ),
        ),
    );

    //Just some filler text
    final lorem = Padding(
        padding:EdgeInsets.all(8.0),
        child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "
              "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut"
              " enim ad minim veniam, quis nostrud exercitation ullamco laboris "
              "nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in"
              " reprehenderit in voluptate velit esse cillum dolore eu fugiat"
              " nulla pariatur. Excepteur sint occaecat cupidatat non proident, "
              "sunt in culpa qui officia deserunt mollit anim id est laborum.",
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
          ),
        ),
    );

    //Put it all together
    final body = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
        //You can set a gradient, pretty neat
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.lightBlueAccent],
        )
      ),
      child: Column(
        children: <Widget>[
          user,
          welcome,
          lorem
        ],
      ),
    );

    //Send it to the screen 
    return Scaffold(
      body: body,
    );
  }
}
