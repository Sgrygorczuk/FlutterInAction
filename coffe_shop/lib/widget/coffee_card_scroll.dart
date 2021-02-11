import 'package:coffe_shop/model/coffee_card_model.dart';
import 'package:flutter/cupertino.dart';
import 'coffee_card.dart';

//=========================== Data =============================================
List<coffeeCardModel> coffeeCards = [
  new coffeeCardModel("assets/starbucks.png", "Caffe Misto", "Coffeeshop", "Our dark, rich espresso balanced with steamed milk and a light layer of foam", "\$4.99" , false),
  new coffeeCardModel("assets/starbucks.png", "Caffe Misto", "Brownhouse", "Rich full-bodied epresso with bittersweet milk sause and steamed milk", "\$3.99" , true),
];
//==============================================================================

///Purpose: A list view that scrolls horizontally through all the coffee cards 
///Input: @context allows us to move to another screen 
///Return: a lit view full of coffee cards to scroll through 
Container coffeeCardScroll(BuildContext context){
  return Container(
    height: 410.0,
    width: 100,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for(var card in coffeeCards ) coffeeCard(context, card),
      ],
    ),
  );
}