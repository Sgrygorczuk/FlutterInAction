import 'package:coffe_shop/widget/coffee_card_scroll.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left : 15.0),
        children: <Widget>[
          SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Welcome, Nadia",
                style: TextStyle(
                  fontFamily: "varela",
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF473D3A),
                ),
              ),
              Padding (
                padding: EdgeInsets.only(right: 15.0),
                child: Container(
                  height: 40.0,
                  width:  40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          image: AssetImage("assets/model.jpg"),
                          fit: BoxFit.cover
                      )
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(right: 45.0),
            child: Container(
              child: Text(
                "Let\'s select the best taste for your next coffee break!",
                style: TextStyle(
                  fontFamily: 'nuito',
                  fontSize: 17.0,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFB0AAA7)
                ),
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Taste of the week",
                style: TextStyle(
                  fontFamily: 'varela',
                  fontSize: 17.0,
                  color: Color(0xFF473D3A)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Text(
                  "See all",
                  style: TextStyle(
                      fontFamily: 'varela',
                        fontSize: 15.0,
                      color: Color(0xFFCEC7C4)
                  ),
                ),
              ),
            ]
            ),
          SizedBox(height : 15.0),
          coffeeCardScroll(),
            ],
      ),
    );
  }
}