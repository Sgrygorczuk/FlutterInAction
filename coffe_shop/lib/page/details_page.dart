import 'package:coffe_shop/widget/filled_in_text.dart';
import 'package:coffe_shop/widget/ingredientsRow.dart';
import 'package:coffe_shop/widget/ingredients_scroll.dart';
import 'package:coffe_shop/widget/line.dart';
import 'package:coffe_shop/widget/userImage.dart';
import 'package:flutter/material.dart';

/// This is the detail page show a coffee with more info about it

///Class of the page
class DetailsPage extends StatefulWidget {
  DetailsPage({Key key}) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

///Logic of the page
class _DetailsPageState extends State<DetailsPage> {
  //================================ Widget ====================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Whole page is a scroll, goes along with the smaller listView
      body: ListView(
        ///Stops the scrolling effect since the page isn't wider than the screen
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ///Makes the pink background
              Container(
                height: MediaQuery.of(context).size.height - 25,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFF3B2B7)
              ),
              ///Makes the smaller box that covers bottom of the screen
              Positioned(
                /// - 20 makes sure that the widgets show up before the
                /// box starts curving
                top : MediaQuery.of(context).size.height/2 - 25,
                child: Container(
                  height:  MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                    color: Colors.white
                  ),
                ),
              ),
              ///Setting up the ListView box inside the white area
              Positioned(
                top: MediaQuery.of(context).size.height/2,
                left : 15.0,
                child: Container(
                  height: (MediaQuery.of(context).size.height / 2),
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [

                      ///Shows the "Preparation time" section
                      filledInText("Preparation time", 'nunito',  14.0, FontWeight.bold, Color(0xFF726B68)),
                      SizedBox(height : 7.0),
                      filledInText("5 min", 'nunito', 14.0, FontWeight.normal, Color(0xFFC6C4C4)),
                      SizedBox(height : 10.0),

                      ///Shows the "Ingredients" section which has a horizontal ingredients scroll
                      line(),
                      SizedBox(height: 10.0),
                      filledInText("Ingredients",'nunito',  14.0, FontWeight.bold, Color(0xFF726B68)),
                      SizedBox(height : 20.0),
                      ///Make the scroll
                      ingredientsScroll(),
                      SizedBox(width: 25.0),

                      ///Shows the "Nutrition Information" section
                      line(),
                      SizedBox(height: 10.0),
                      filledInText("Nutrition Information", 'nunito', 14.0, FontWeight.bold, Color(0xFF726B68)),
                      SizedBox(height: 10.0),
                      ingredientsRow('Calories', '250'),
                      SizedBox(height: 10.0),
                      ingredientsRow('Proteins', '10g'),
                      SizedBox(height: 10.0),
                      ingredientsRow('Caffeine', '150mg'),
                      SizedBox(height: 15.0),

                      ///Makes the fake button
                      line(),
                      SizedBox(height: 10.0),
                      Padding(
                          padding: EdgeInsets.only(right: 25.0),
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: Color(0xFF473D3A),
                            ),
                            child: Center(
                              child: filledInText('Make Order', 'nunito', 14.0, FontWeight.bold, Colors.white)
                              )
                            ),
                          ),
                      SizedBox(height: 35.0)
                    ]
                  )
                )
              ),
              ///Shows the image of the coffe cup
              Positioned(
                  top: MediaQuery.of(context).size.height /10,
                  left: 75.0,
                  child: Container(
                      height: 400.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/pinkcup.png'),
                              fit: BoxFit.cover
                          )
                      )
                  )
              ),
              ///Text on the top of the screen
              Positioned(
                  top: 25.0,
                  left: 15.0,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            children : [
                              ///Title
                              Container(
                               width: 160.0,
                               child : filledInText('Caramel Macchiato', 'varela', 30.0, FontWeight.bold, Colors.white),
                              ),
                              ///The fake favorite icon button
                              Container(
                                height: 50.0,
                                width: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.white
                                ),
                                child: Center(
                                    child: Icon(Icons.favorite, size: 18.0, color: Colors.red)
                                ),
                              ),
                         ]
                        ),
                        SizedBox(height: 10.0),
                        ///Description of the coffee
                        Container(
                          width: 170.0,
                          child : filledInText('Freshly steamed milk with vanilla-flavored syrup is marked with espresso and topped with caramel drizzle for an oh-so-sweet finish.',
                              'nunito', 13.0, FontWeight.normal, Colors.white),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            ///Rating of the coffee by users
                            Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Color(0xFF473D3A)
                              ),
                              child: Center(

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    filledInText('4.2', 'nunito', 13.0, FontWeight.normal, Colors.white),
                                    filledInText('/5', 'nunito', 13.0, FontWeight.normal,  Color(0xFF7C7573)),
                                   ],
                                ),
                              )
                            ),
                            SizedBox(width: 10.0),
                            ///The users that rated the coffee
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget> [
                                  Stack(children: [
                                    Container(
                                        height: 35.0,
                                        width: 80.0
                                    ),
                                    userImage(40, 'assets/man.jpg'),
                                    userImage(20, 'assets/model.jpg'),
                                    userImage(0, 'assets/model2.jpg'),
                                  ],
                                  ),
                                  SizedBox(height: 3.0),
                                  filledInText('+ 27 more', 'nunito', 12.0, FontWeight.normal, Colors.white)
                                ]
                            ),
                          ]
                        ),
                ]
              )
              )
              )
            ],
          )
        ],
      ),
    );
  }
}
