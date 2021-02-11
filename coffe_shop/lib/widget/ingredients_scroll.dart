import 'package:coffe_shop/model/ingredient_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'ingredients_card.dart';

//=========================== Data =============================================
List<ingredientModel> ingredients = [
  new ingredientModel("Water", Icon(FlutterIcons.droplet_fea, size: 10.0, color: Colors.white), Color(0xFF6FC5DA)),
  new ingredientModel('Brewed Espresso',  Icon(FlutterIcons.target_fea, size: 18.0, color: Colors.white), Color(0xFF615955)),
  new ingredientModel('Sugar', Icon(FlutterIcons.box_fea, size: 18.0, color: Colors.white), Color(0xFFF39595)),
  new ingredientModel('Toffee Nut Syrup', Icon(FlutterIcons.peanut_mco, size: 18.0, color: Colors.white), Color(0xFF8FC28A)),
  new ingredientModel('Natural Flavors', Icon(FlutterIcons.leaf_maple_mco, size: 18.0, color: Colors.white), Color(0xFF3B8079)),
  new ingredientModel('Vanilla Syrup', Icon(FlutterIcons.flower_tulip_mco, size: 18.0, color: Colors.white), Color(0xFFF8B870))
];
//==============================================================================

///Purpose: A list view that scrolls horizontally through all the ingredient cards
///Input: Void
///Return: a list view full of ingredient cards to scroll through
Container ingredientsScroll(){
  return Container(
    height: 110.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for(var ingredient in ingredients) ingredientsCard(ingredient.name, ingredient.icon, ingredient.color)
      ],
    ),
  );
}