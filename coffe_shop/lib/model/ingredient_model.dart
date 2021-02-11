import 'package:flutter/material.dart';

///The model that holds data for ingredient cards
class ingredientModel{
  String name;
  Icon icon;
  Color color;

  ///Purpose: Holds data that will show up in the ingredients list view
  ///Input: @name of the ingredients
  ///       @icon the Icon widget will be displayed
  ///       @color color of the ingredients box
  ///Return: ingredientModel with all the data for ingredient card
  ingredientModel(String name, Icon icon, Color color){
    this.name = name;
    this.icon = icon;
    this.color = color;
  }
}