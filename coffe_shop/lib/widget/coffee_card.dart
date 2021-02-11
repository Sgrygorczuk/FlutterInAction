import 'package:coffe_shop/model/coffee_card_model.dart';
import 'package:coffe_shop/page/details_page.dart';
import 'package:flutter/material.dart';
import 'filled_in_text.dart';

///Purpose: A generic coffee card widget showed off at the main screen
///Input: @context allows us to move to a different screen
///       @coffeeCardModel holds all the data that a coffee card displays 
///Return: Gives back a coffeeCard widget
Padding coffeeCard(BuildContext context, coffeeCardModel coffeeCardModel){
  return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
    child: Container(
      height: 300,
      width: 255,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 335.0,
              ),
              Positioned(
                top: 75.0,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 20),
                    height: 260.0,
                    width: 225.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFFDAB68C)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ///All the text on the card
                        SizedBox(height: 60),
                        filledInText(coffeeCardModel.shopName + '\'s', 'nunito', 14.0, FontWeight.bold, Colors.white),
                        SizedBox(height: 10),
                        filledInText(coffeeCardModel.coffeeName, 'varela', 32.0, FontWeight.bold, Colors.white),
                        SizedBox(height:  10),
                        filledInText(coffeeCardModel.description, 'nunito', 14.0, FontWeight.normal, Colors.white),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            filledInText(coffeeCardModel.price, 'varela', 25.0, FontWeight.bold, Color(0xFF3A4742)),
                            ///Shows off the favorite icon
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white
                              ),
                              child: Center(
                                child: Icon(
                                    Icons.favorite,
                                  color: coffeeCardModel.isFavorite ? Colors.red : Colors.grey,
                                  size : 15.0
                                )
                              )
                            )
                          ]
                        )
                      ]
                    )
                  )
              ),
              ///Image of the coffee on top of the card
              Positioned(
                left : 60,
                top: 25.0,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(coffeeCardModel.imgPath),
                      fit: BoxFit.contain
                    )
                  )
                )
              )
            ]
          ),
          SizedBox(height: 20.0,),
          ///Button to go to the display Page
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage()));
              },
              child: Container(
                height: 50.0,
                width: 225,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color(0xFF473D3A)
                ),
                child: Center(
                  child: filledInText('Order Now', 'nunito', 14.0, FontWeight.bold, Colors.white)
                ),
              ),
            )
        ],
      ),
    ),
  );
}