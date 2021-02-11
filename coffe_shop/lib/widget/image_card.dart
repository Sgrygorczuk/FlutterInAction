import 'package:flutter/material.dart';

///Purpose: Holds the data that shows off the coffee on the bottom of the main screen
///Input: @imgPath the path to image
///Return: Padding with image of the coffee in the explore nearby section
Padding buildImage(String imgPath){
  return Padding(
      padding : EdgeInsets.only(right: 15.0),
    child: Container(
      height: 100.0,
      width: 175.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          image: AssetImage(imgPath),
          fit: BoxFit.cover,
        )
      ),
    ),
  );
}