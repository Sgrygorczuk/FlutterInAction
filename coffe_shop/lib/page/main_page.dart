import 'package:coffe_shop/widget/coffee_card_scroll.dart';
import 'package:coffe_shop/widget/filled_in_text.dart';
import 'package:coffe_shop/widget/image_list_scroll.dart';
import 'package:coffe_shop/widget/row_title.dart';
import 'package:flutter/material.dart';

/// This is the first page you see, shows of a bunch of choices
/// of coffees from different shops, they all lead to the same type mock
/// coffee screen

///Class of the page
class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

///Logic of the page
class _MainPageState extends State<MainPage> {
  //================================= Widget ===================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Sets the screen to be able to scroll
      body: ListView(
        ///Offset 15 from the left side of the screen
        padding: EdgeInsets.only(left : 15.0),
        children: <Widget>[
          SizedBox(height: 50.0),
          ///The top of the screen, hello user, user image and the welcome line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ///Hello user
              filledInText("Welcome, Nadia", "varela", 30.0, FontWeight.bold,
                  Color(0xFF473D3A)),
              ///Drawing the image
              Padding (
                padding: EdgeInsets.only(right: 15.0),
                child: Container(
                  height: 40.0,
                  width:  40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          image: AssetImage("assets/model.jpg"),
                          ///Use the fit to make sure that the image is cut
                          ///in shape of the box
                          fit: BoxFit.cover
                      )
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          ///welcome line
          Padding(
            padding: const EdgeInsets.only(right: 45.0),
            child: Container(
              child : filledInText("Let\'s select the best taste for your next "
                  "coffee break!", 'nuito', 17.0, FontWeight.w300, Color(0xFFB0AAA7))
            ),
          ),
          SizedBox(height: 25.0),
          rowTitle('Taste of the week'),
          SizedBox(height : 15.0),
          ///The big boxes that can be scrolled by in the middle of the screen
          coffeeCardScroll(context),
          SizedBox(height: 15),
          rowTitle('Explore nearby'),
          SizedBox(height: 15),
          ///Draws the scrolling images on the bottom of the screen
          imageList(),
          SizedBox(height: 25),
        ],
      ),
    );
  }
  //============================================================================
}